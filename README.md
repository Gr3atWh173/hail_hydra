# HailHydra

HailHydra is an unofficial pseudo-API for ThePirateBay.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hail_hydra'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hail_hydra

## Usage

From the command line:
```
$ thepiratebay totallynotillegal 2
```

From code
```ruby
s = HailHydra::TPB("https://thepiratebay.org")

res = s.search('totallynotillegal', 2) #=> two pages worth of Torrent objects
puts res[0].name + " " + res[0].url 

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Gr3atWh173/hail_hydra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HailHydra project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Gr3atWh173/hail_hydra/blob/master/CODE_OF_CONDUCT.md).
