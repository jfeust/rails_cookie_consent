# frozen_string_literal: true

require_relative "rails_cookie_consent/version"
require_relative "rails_cookie_consent/engine" if defined?(::Rails)

module RailsCookieConsent
  class Error < StandardError; end
  # Your code goes here...
end
