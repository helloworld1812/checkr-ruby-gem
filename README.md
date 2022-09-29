![image](https://user-images.githubusercontent.com/1224077/192267419-0cb46ddf-22dc-4211-adfe-dddba503340c.png)

# Checkr Ruby Gem

Ruby toolkit for checkr.com API.

## REST APIs and documentation
 
[Checkr Web Service API Documentation](https://docs.checkr.com/)
 
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'checkr-ruby-gem'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install checkr_web_service

## Config the gem

```ruby
# config/initializers/checkr_web_service.rb

CheckrWebService.configure do |config|
  config.client_id = 'your_client_id'
  config.client_secret = 'your_client_secret' 
end
```

## Making requests

```ruby
# Provide authentication credentials
client = CheckrWebService::Client.new(access_token: 'xy7CmAYvkjJU%F4JNpf7H*W1V')

# retrieve the account information
client.account

# retrieve packages
client.packages

# retrieve nodes
client.nodes

# retrieve nodes including packages.
client.nodes(query: {include: 'packages'})
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/helloworld1812/checkr-ruby-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Here are some ways you can contribute:

- by reporting bugs
- by suggesting new features
- by writing or editing documentation
- by writing test case
- by writing code (no patch is too small: fix typos, add comments, clean up inconsistent whitespace)
- by refactoring code
- by closing issues
- by reviewing patches

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in this project’s codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wotc-ruby-gem/blob/master/CODE_OF_CONDUCT.md).

## Reference

**Good examples of API Wrapper**

- [Octokit](https://github.com/octokit/octokit.rb/blob/master/lib/octokit/client.rb)
- [Instagram](https://github.com/Instagram/instagram-ruby-gem/blob/master/lib/instagram/client.rb)
- [Twitter](https://github.com/sferik/twitter/blob/master/lib/twitter/rest/api.rb)

