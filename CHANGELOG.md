## [0.4.3]
- fallback delete cookie consent when unable to parse
- handle nil parsed cookie consent in helper

## [0.4.1]
- lower ruby requirement to >= 2.3

## [0.4.0]

- bump cookie consent lib to `2.8.0`
- update README to show supported configuration
- fix problem with not existing rails_cookie_consent_theme asset

### Breaking:

- use of `rails_cookie_consent_theme.css` must be enabled explicitly through `config.enable_theme_css = true`

## [0.3.0]
- cookie consent version 2.7.0
