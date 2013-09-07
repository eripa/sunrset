require "sunrset/version"
require 'net/http'
require 'rubygems'
require 'xmlsimple'
require 'date'

module Sunrset
  class TimeAndSun
    attr_reader :time_data, :sun_data, :date
    def initialize longitude, latitude
      url_time_api = "http://www.earthtools.org/timezone/#{longitude}/#{latitude}"
      p url_time_api
      time_xml_data = Net::HTTP.get_response(URI.parse(url_time_api)).body
      @time_data = XmlSimple.xml_in(time_xml_data)
      @date = DateTime.parse @time_data["localtime"].first

      url_sun_api = "http://www.earthtools.org/sun/#{longitude}/#{latitude}/#{"%02d" % @date.day}/#{"%02d" % @date.month}/#{time_zone}/#{dst? ? 1 : 0}"
      sun_xml_data = Net::HTTP.get_response(URI.parse(url_sun_api)).body
      @sun_data = XmlSimple.xml_in(sun_xml_data)
    end

    def dst?
      @time_data["dst"].first.eql?("True") ? true : false
    end

    def time_zone
      offset = @time_data["offset"].first
      offset.to_i > 0 ? "+#{offset}" : offset
    end

    def sunrise
      DateTime.parse "#{@date.to_date.to_s} #{@sun_data["morning"].first["sunrise"].first}"
    end

    def sunset
      DateTime.parse "#{@date.to_date.to_s} #{@sun_data["evening"].first["sunset"].first}"
    end
  end

end
