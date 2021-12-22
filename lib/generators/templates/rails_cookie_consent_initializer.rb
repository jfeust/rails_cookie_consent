ENV['RAILS_COOKIE_CONSENT_PRECOMPILE'] = Time.current.iso8601.to_s # force asset precompile with new YAML values

RailsCookieConsent.configure do |config|
  # config.cookie_types = [
  #   { value: 'necessary', readonly: true, enabled: true, required: true },
  # ]
end
