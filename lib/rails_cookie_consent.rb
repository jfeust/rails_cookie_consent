# frozen_string_literal: true

require_relative 'rails_cookie_consent/version'
require_relative 'rails_cookie_consent/engine' if defined?(::Rails)
require 'ostruct' # for older ruby versions

module RailsCookieConsent
  class Error < StandardError; end

  class << self
    DEFAULT_CONFIG = {
      revision: 0,
      force_consent: true,
      autoclear_cookies: true,                # default: false
      theme_css: '',                          # replace with a valid path
      page_scripts: true,                     # default: false
      delay: 0,                               # default: 0
      auto_language: '',                      # default: null; could also be 'browser' or 'document'
      autorun: true,                          # default: true
      hide_from_bots: false,                  # default: false
      remove_cookie_tables: false,            # default: false
      cookie_name: 'cc_cookie',               # default: 'cc_cookie'
      cookie_expiration: 182,                 # default: 182 (days)
      cookie_necessary_only_expiration: 182,  # default: disabled
      cookie_path: '/',                       # default: root
      cookie_same_site: 'Lax',                # default: 'Lax'
      use_rfc_cookie: false                   # default: false
    }.freeze

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

end
