# RailsCookieConsent
[![version](https://img.shields.io/badge/version-0.4.2-brightgreen)](https://img.shields.io/badge/version-0.4.0-brightgreen)
[![cookie consent version](https://img.shields.io/badge/cookie%20consent%20version-2.8.0-informational)](https://github.com/orestbida/cookieconsent/releases/tag/v2.8.0)


This gem use https://github.com/orestbida/cookieconsent library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_cookie_consent', tag: '0.4.4', github: 'railsformers/rails_cookie_consent'
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

If you change cookie files and want to force precompilation to view changes, just restart server or update `ENV['RAILS_COOKIE_CONSENT_PRECOMPILE']` variable. If this doesn't work, just change any of your precompiled assets.

### Generate cookie translations
```bash
$ rails generate rails_cookie_consent
```

This will generate translation files to you `config/locales`.

## Usage

You can configure gem through initializer. Value property is fully optional.

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

This gem adds helper method `cookie_consent?(key)`. You can quickly check If user granted consent for particular type.
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

### Possible config options through initializer

```ruby
RailsCookieConsent.configure do |config|
    # check RailsCookieConsent::DEFAULT_CONFIG for options
    config.cookie_types = [
      { value: 'necessary', readonly: true, enabled: true, required: true }
    ]
    config.revision = 0                               # when changed, cookie consent is displayed again for all users
    config.force_consent = true                       # force user to accept or deny consent before page is accessible
    config.autoclear_cookies = false                  # if enabled, cookies names must be specified in yaml table in first column
    config.enable_theme_css = false                   # enable custom theme from rails_cookie_consent.css or theme_css path
    config.theme_css = ''                             # own path to styled consent theme stylesheet
    config.page_scripts = true
    config.delay = 0                                  # after what delay to show cookie consent
    config.auto_language = ''                         # I18n.default_locale is used if empty
    config.autorun = true                             # autostart on startup
    config.hide_from_bots = false
    config.remove_cookie_tables = false
    config.cookie_name = 'cc_cookie'                  # cookie consent key
    config.cookie_expiration = 365
    config.cookie_necessary_only_expiration = 365
    config.cookie_path = '/'
    config.cookie_domain = 'locahost:3000'
    config.cookie_same_site = 'Lax'
end
```

### Styles

It's possible to change cookie consent styles. To do so, please do following:
1. Enable theme css in initializer. `confgig.enable_theme_css = true`
2. Create `rails_cookie_consent_theme.css` in `/app/assets/stylesheets/` or provide path in initializer through `config.theme_css = 'path-to-css`.
3. Check https://github.com/orestbida/cookieconsent/blob/master/src/cookieconsent.css for options.

## Development

### Upgrading cookieconsent library.
1. Upgrade assets with new version from https://github.com/orestbida/cookieconsent
2. Update VERSIONS in `lib/rails_cookie_consent/version.rb`
3. Update README.
4. Push and tag new version. Fill changelog.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on Gitlab at https://gitlab.railsformers.com/railsformers/rails_cookie_consent.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
