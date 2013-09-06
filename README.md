# Sunrset

A simple gem for getting time, date and current sunrise/sunset times based on given coordinates

## Installation

Add this line to your application's Gemfile:

    gem 'sunrset'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sunrset

## Usage

  require 'sunrset'
  d = Sunrset::TimeAndSun.new "40.83771", "-73.928375"
  puts d.time_data.inspect
  puts d.sun_data.inspect
  puts d.sunrise.inspect
  puts d.sunset.inspect

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
