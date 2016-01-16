module TelegramBot
  module Model
    class Base
      include ::ActiveModel::Model
      include ::ActiveModel::Validations
      include ::ActiveModel::Serialization
      include ::ActiveModel::Serializers::JSON

      # As the models include a lot of different objects related,
      # we build a conversion hash that indicates the type of objects
      # required in special fields.
      FIELD_CONVERSIONS = {}

      # Initializer that converts the fields received if necessary
      def initialize(attributes = {})

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

        super(attributes)
      end

      # Attribute map for ActiveModel::Serialization.
      def attributes
        Hash[instance_variables.map{|attrib| [attrib.to_s[1..attrib.to_s.size], nil]}]
      end

      # Proxy to get a serialized version of the object.
      def to_h
        recursive_serialization(self)
      end

      private

      # Method to try to recursively seralize the objects received
      def recursive_serialization object
        if (object.is_a?(Array))
          # If it's an array, try to serialize each element
          return object.map{|o| recursive_serialization(o)}
        elsif (object.is_a?(Hash))
          # It's a hash, convert each key to sym and try to serialize each value
          return Hash[object.map{|k,v| [k.to_sym, recursive_serialization(v)]}]
        elsif (object.respond_to?(:serializable_hash))
          # If it can be seralized, serialize and try to recursively convert it's attributes
          return recursive_serialization(object.serializable_hash)
        else
          return object
        end
      end
    end
  end
end
