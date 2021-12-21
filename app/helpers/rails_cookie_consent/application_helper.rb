module RailsCookieConsent
  module ApplicationHelper
    def cookie_consent?(key)
      return false if base_cookie.blank?

      begin
        parsed = JSON.parse(base_cookie)
        parsed['level'].present? && parsed['level'].include?(key.to_s)
      rescue JSON::ParserError
        false
      end
    end

    def cookie_consent_link(options = {})
      link_to(I18n.t('rails_cookie_consent.link_text'), 'javascript:void(0);', data: { cc: 'c-settings' }, class: options[:class], remote: options[:remote])
    end

    def base_cookie
      cookies[RailsCookieConsent.config.cookie_name]
    end
  end
end
