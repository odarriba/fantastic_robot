module TelegramBot
  module Model
    class Base
      include ::ActiveModel::Model
      include ::ActiveModel::Validations

      # As the models include a lot of different objects related,
      # we build a conversion hash that indicates the type of objects
      # required in special fields.
      FIELD_CONVERSIONS = {}

      # Initializer that converts the fields received if necessary
      def initialize(attributes = {})
        super()

        self.class::FIELD_CONVERSIONS.each do |field_name, field_type|
          self.class.send(:define_method, "#{field_name}=") do |value|
            if (value.is_a?(Array))
              value.map! do |v|
                v = field_type.new(v) unless (v.class == field_type || v.blank?)
              end
            else
              value = field_type.new(value) unless (value.class == field_type || value.blank?)
            end

            instance_variable_set("@#{field_name}", value)
          end
        end

        unless attributes.blank?
          attributes.each do |name, value|
            self.send("#{name}=", value)
            attributes.delete(name)
          end
        end
      end
    end
  end
end
