module TelegramBot
  module Request
    class Base
      include ::ActiveModel::Model
      include ::ActiveModel::Validations
      include ::ActiveModel::Serialization
      include ::ActiveModel::Serializers::JSON

      # Initializer that assigns the fields received
      def initialize(attributes = {})
        super(attributes)
      end

      # Attribute map for ActiveModel::Serialization.
      def attributes
        Hash[instance_variables.map{|attrib| [attrib[1..attrib.size], nil]}]
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
