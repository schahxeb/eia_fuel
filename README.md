# EIA Fuel

Use this gem to fetch data published by US Energy Information Administration [(eia.gov)](https://www.eia.gov/) and delivered via their public API.

You will need to [register for your own API key](https://www.eia.gov/opendata/register.php) on their website in order to use the gem.

View all the API endpoints at the [EIA API query browser](https://www.eia.gov/opendata/qb.php).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eia_fuel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eia_fuel

## Usage

Require the gem
```ruby  
require 'eia_fuel'
```

```ruby
# Instantiate and use client instance
client = EiaFuel::Client.new(your_api_key)

# Use the client to fetch a series
series = client.get('PET.EMD_EPD2D_PTE_NUS_DPG.W')
#=> #<EiaFuel::Series:0x00007f7f4e10b380 ... >

# the series contains the information you want
series.description
#=> "EIA petroleum gas survey data"
series.data
#=> [#<struct EiaFuel::Tuple date=#<Date: 2018-07-02 ((2458302j,0s,0n),+0s,2299161j)>, price=3.236>,
 #<struct EiaFuel::Tuple date=#<Date: 2018-06-25 ((2458295j,0s,0n),+0s,2299161j)>, price=3.216>,
 #<struct EiaFuel::Tuple date=#<Date: 2018-06-18 ((2458288j,0s,0n),+0s,2299161j)>, price=3.244>,
 #<struct EiaFuel::Tuple date=#<Date: 2018-06-11 ((2458281j,0s,0n),+0s,2299161j)>, price=3.266>...]
series.latest_price
#=> 3.234
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/taylorstib/eia_fuel. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EiaFuel project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/eia_fuel/blob/master/CODE_OF_CONDUCT.md).
