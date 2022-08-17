# RailsAdminTokens
This Rails Admin action allows you to configure an action to be called on the object.
The motivation behind this was to manually update oauth2 tokens but can be used to call any action on the object.

## Usage
After adding this gem to your bundle, you can setup your rails_admin initializer to include tokens, like so:
```ruby
  config.actions do
      dashboard                     # mandatory
      index                         # mandatory
      # ...
    
      tokens do
        only ['MyTargetUser']
      end
  end
```
Customize your view:
````ruby
# views/rails_admin/main/tokens.html.erb
````

## Installation
Add this line to your application's Gemfile:

```ruby
gem "rails_admin_tokens"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_admin_tokens
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
