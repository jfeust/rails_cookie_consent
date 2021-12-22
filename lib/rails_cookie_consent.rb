# frozen_string_literal: true

require_relative 'rails_cookie_consent/version'
require 'ostruct' # for older ruby versions

module RailsCookieConsent
  class Error < StandardError; end

  if defined?(::Rails)
    require_relative 'rails_cookie_consent/engine'
  end

  class << self
    DEFAULT_CONFIG = {
      revision: 0,
      force_consent: true,
      autoclear_cookies: false,
      theme_css: '',
      page_scripts: true,
      delay: 0,
      auto_language: '',
      autorun: true,
      hide_from_bots: false,
      remove_cookie_tables: false,
      cookie_name: 'cc_cookie',
      cookie_expiration: 182, # days
      cookie_necessary_only_expiration: 182, # days
      cookie_path: '/',
      cookie_same_site: 'Lax',
      cookie_types: [] # { value: 'necessary', enabled: true, readonly: false }
    }

    def config
      @config ||= OpenStruct.new(DEFAULT_CONFIG)
    end

    def configure
      yield(config)
    end

    def languages_config
      locales = {}

      I18n.available_locales.each do |locale|
        I18n.locale = locale

        locales[locale] = {
          consent_modal: {
            title: I18n.t('rails_cookie_consent.title'),
            description: I18n.t('rails_cookie_consent.description'),
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
            blocks: generate_blocks(locale)
          }
        }
      end

      locales
    end

    def generate_blocks(locale)
      result = []

      RailsCookieConsent.config.cookie_types.each do |cookie_type|
        type = cookie_type[:value]

        hash = {
          title: I18n.t("rails_cookie_consent.cookie_types.#{type}.title"),
          description: I18n.t("rails_cookie_consent.cookie_types.#{type}.description"),
          toggle: cookie_type,
        }

        cookie_table = Array(I18n.t("rails_cookie_consent.cookie_types.#{type}.cookie_table", default: nil))
        hash[:cookie_table] = cookie_table

        result << hash
      end

      result
    end
  end
end
