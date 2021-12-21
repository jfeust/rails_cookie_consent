class RailsCookieConsent::Config
  def self.languages_config
    locales = {}

    I18n.available_locales.each do |locale|
      I18n.locale = locale

      locales[locale] = {
        consent_modal: {
          title: I18n.t('rails_cookie_consent.title'),
          description: I18n.t("rails_cookie_consent.description"),
          primary_btn: {
            text: I18n.t('rails_cookie_consent.primary_btn.text'),
            role: I18n.t('rails_cookie_consent.primary_btn.role'), # 'accept_selected' or 'accept_all'
          },
          secondary_btn: {
            text: I18n.t('rails_cookie_consent.secondary_btn.text'),
            role: I18n.t('rails_cookie_consent.secondary_btn.role'), # 'accept_selected' or 'accept_all'
          }
        },
        settings_modal: {
          title: I18n.t('rails_cookie_consent.settings_modal.title'),
          save_settings_btn: I18n.t('rails_cookie_consent.settings_modal.save_settings_btn'),
          accept_all_btn: I18n.t('rails_cookie_consent.settings_modal.accept_all_btn'),
          reject_all_btn: I18n.t('rails_cookie_consent.settings_modal.reject_all_btn'),
          close_btn_label: I18n.t('rails_cookie_consent.settings_modal.close_btn_label'),
          cookie_table_headers: I18n.t('rails_cookie_consent.cookie_table_headers'),
          blocks: I18n.t('rails_cookie_consent.blocks')
        }
      }
    end

    locales
  end
end
