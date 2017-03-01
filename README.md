# Rodir

rodir is Ruby Object Directory

## Installation

```
$ gem install rodir
```

## Usage

run `rodir`

```
$ rodir                                                                                                                                                       [master]
Ruby@2.4.0 /BasicObject$ ls
<M>	#<Module:0x007fb11a911388>
<M>	Kernel
Ruby@2.4.0 /BasicObject$ cd Kernel
lRuby@2.4.0 /BasicObject/Kernel$ ls
<C>	Object
Ruby@2.4.0 /BasicObject/Kernel$ cd Object
Ruby@2.4.0 /BasicObject/Kernel/Object$ pwd
BasicObject/Kernel/Object
```

can use `tree` command

```
Ruby@2.4.0 /BasicObject/Kernel/Object/Comparable$ ls
<M>	Colorize::InstanceMethods
<C>	File::Stat
<C>	Gem::Version
<C>	Numeric
<C>	Symbol
<C>	Time
Ruby@2.4.0 /BasicObject/Kernel/Object/Comparable$ tree
<M> Comparable
├───── <M> Colorize::InstanceMethods
│       └───── <C> String
├───── <C> File::Stat
├───── <C> Gem::Version
├───── <C> Numeric
│       ├───── <C> Complex
│       ├───── <C> Float
│       ├───── <C> Integer
│       └───── <C> Rational
├───── <C> Symbol
└───── <C> Time
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/siman-man/rodir. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

