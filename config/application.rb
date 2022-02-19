require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Instigrim
  class Application < Rails::Application

    config.load_defaults 6.0
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.generators do |g|
      # この二行の記述で自動生成しない設定を作成しています。
      g.assets false
      g.helper false
    end
  end
end
