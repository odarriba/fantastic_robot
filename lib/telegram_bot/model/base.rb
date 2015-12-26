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

        # Define a setter for each field that need to be converted
        self.class::FIELD_CONVERSIONS.each do |field_name, field_type|
          self.class.send(:define_method, "#{field_name}=") do |value|
            if (value.is_a?(Array))
              # If we receive an array, process each value
              value.map! do |v|
                # Convert each object except if it is already converted or nil
                v = ((v.class == field_type || v.nil?) ? v : field_type.new(v))
              end
            else
              # If it isn't an array, try to convert the object
              value = field_type.new(value) unless (value.class == field_type || value.nil?)
            end

            # Set the result
            instance_variable_set("@#{field_name}", value)
          end
        end

        unless attributes.blank?
          # Try to set each attribute received
          attributes.each{ |name, value| self.send("#{name}=", value) }
        end
      end
    end
  end
end
