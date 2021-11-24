# Bob

Bob is a Ruby wrapper and CLI for the [Bob API](https://apidocs.hibob.com/). To interact with this Ruby gem you need
access to Bob. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bob-hr'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bob-hr

## Usage

Create a Service User in Bob and use the ID and token to configure the client.

Configuration example:

```ruby

Bob.configure do |config|
  config.access_token = 'your-access-token'
  config.access_user_name = 'your-access-user-name'
end
```

Usage examples:

```ruby

Bob.access_token = 'your-access-token'
employee = Bob::Employees.find(1)
employee_trainings = Bob::Employees::Trainings.all(1)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hibob. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hibob/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Hibob project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hibob/blob/master/CODE_OF_CONDUCT.md).
