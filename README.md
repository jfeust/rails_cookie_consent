# RailsCookieConsent

This gem use https://github.com/orestbida/cookieconsent library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_cookie_consent'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rails_cookie_consent


Add this to your `application.css`

    *= require rails_cookie_consent

Add this to your `application.js`

    #= require rails_cookie_consent

Or add these lines to your view

    = stylesheet_link_tag 'rails_cookie_consent'
    = javascript_include_tag 'rails_cookie_consent'

### Force recompilation

If you change cookie files and want to force precompilation, just restart server or change `ENV['RAILS_COOKIE_CONSENT_PRECOMPILE']` variable.

### Generate cookie translations
```bash
$ rails generate rails_cookie_consent
```

This will generate translation files to you `config/locales`.

## Usage

You can configure gem through initializer

```ruby
RailsCookieConsent.configure do |config|
    # check RailsCookieConsent::DEFAULT_CONFIG for options
    config.cookie_types = [
      { value: 'necessary', readonly: true, enabled: true, required: true },
      { value: 'required', readonly: false, enabled: false, required: false }
    ]
end
```

In translations then:

```yaml
  # ...
  cookie_types:
      necessary:
        title: Necessary
        description: Desc
      required:
        title: Required
        description: Desc
        cookie_table:
          - col1: Val
            col2: Second val

```

All cookies are specified through generated YAML files. You can specify new cookies through `blocks:` key.


Use `cookie_consent_link` helper generate link to cookie setting in view:

    = cookie_consent_link class: 'btn'

### Use in views and controllers

This gem adds helper method `cookie_consent?(key)`. You can quickly check If user granted consent with particular consent.
```ruby
  if cookie_consent?('necessary')
    # Your logic
  end
```

If you want to access this method in controller add these lines:

```ruby
class ApplicationController < ActionController::Base
    include RailsCookieConsent::CookieHelper

    helper_method :cookie_consent?
end
```

### Styles

You can change styles by creating css file `rails_cookie_consent_theme.css`. Check https://github.com/orestbida/cookieconsent/blob/master/src/cookieconsent.css for options.

## Development

### Upgrading cookieconsent library.
1. Upgrade assets with new version from https://github.com/orestbida/cookieconsent
2. Update VERSIONS in `lib/rails_cookie_consent/version.rb`
3. Push new version.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on Gitlab at https://gitlab.railsformers.com/railsformers/rails_cookie_consent.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
