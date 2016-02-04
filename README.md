# Rack::Downcase

Rack::Downcase is a Rack application the downcases the path of every GET request and performs a 301 redirect.

Why? We have other rack middleware that depends on lowercase paths, so we cannot rely on alternative solutions that downcase in the router but do not redirect.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-downcase'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-downcase

## Usage

### Rails

**config/application.rb**
``` ruby
config.middleware.insert_before(0, "Rack::Slashless")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/desiringgod/rack-downcase.

## Alternate Solutions

* https://github.com/carstengehling/route_downcaser downcases paths in the router but does not redirect
* https://rubygems.org/gems/rack-case-insensitive-routes downcases paths in the router but does not redirect

## Acknowledgements

* Basic structure and strategies adapted from https://github.com/gregorym/rack_slashless

## Author

[Ben Hutton](https://github.com/benhutton)
