require 'rails/generators/named_base'

module FantasticRobot
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../files", __FILE__)

      def copy_config_files
        copy_file "fantastic_robot.rb", "config/initializers/fantastic_robot.rb"
      end
    end
  end
end
