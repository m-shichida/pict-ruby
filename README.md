# PictRuby

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/pict/ruby`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Install the gem and add to the application's Gemfile by executing:

$ bundle add pict-ruby

If bundler is not being used to manage dependencies, install the gem by executing:

$ gem install pict-ruby

## Usage

```
parameters = [
  ["iPhone", "Pixel", "XPERIA"],
  ["IOS", "Android"],
  ["Firefox", "Chrome"]
]
pict_ruby = PictRuby.generate_test_cases(parameters)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pict-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/pict-ruby/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the PictRuby project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pict-ruby/blob/master/CODE_OF_CONDUCT.md).
