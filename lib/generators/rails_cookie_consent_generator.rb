class RailsCookieConsentGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer
    copy_file 'rails_cookie_consent_initializer.rb', 'config/initializers/rails_cookie_consent.rb'

    copy_file 'locales/rails_cookie_consent.cs.yml', 'config/locales/rails_cookie_consent.cs.yml'
    copy_file 'locales/rails_cookie_consent.en.yml', 'config/locales/rails_cookie_consent.en.yml'
  end
end
