# HailHydra

<img src="logo.jpg"></img><brs>

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
$ thepiratebay totallynotillegal
```

From code
```ruby
s = HailHydra::TPB.new("https://apibay.org")

res = s.search('totallynotillegal')
res.each do |torrent|
    puts torrent.name + " " + torrent.size
end

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Gr3atWh173/hail_hydra. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HailHydra project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Gr3atWh173/hail_hydra/blob/master/CODE_OF_CONDUCT.md).

## DISCLAIMER
Neither this project nor its author are related to ThePirateBay in any way.
