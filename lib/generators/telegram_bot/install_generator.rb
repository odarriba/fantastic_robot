require 'rails/generators/named_base'

module TelegramBot
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../files", __FILE__)

      def copy_config_files
        copy_file "telegram_bot.rb", "config/initializers/telegram_bot.rb"
      end
    end
  end
end
