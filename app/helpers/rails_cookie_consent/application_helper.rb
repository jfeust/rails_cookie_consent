module RailsCookieConsent
  module ApplicationHelper
    def cookie_consent?(key)
      true
    end

    def cookie_consent_link(options = {})
      link_to(I18n.t('rails_cookie_consent.link_text'), 'javascript:void(0);', data: { cc: 'c-settings' }, class: options[:class], remote: options[:remote])
    end
  end
end
