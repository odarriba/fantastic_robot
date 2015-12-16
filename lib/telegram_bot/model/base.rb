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
      def intialize(attributes = {})
        attributes.each do |name, value|
          if (value.is_a?(Array))
            # It's a collection of objects, build each one independently and
            # then assign to the field in an array
            objects = []

            value.each do |v|
              # onvert (if possible) and add to the collection
              v = FIELD_CONVERSIONS[name.to_sym].new(v) unless (FIELD_CONVERSIONS[name.to_sym].blank?)
              objects << v
            end

            send("#{name}=", objects)
          else
            # It's a single object, we try to built it

            # Convert (if possible) and assign
            value = FIELD_CONVERSIONS[name.to_sym].new(value) unless (FIELD_CONVERSIONS[name.to_sym].blank?)
            send("#{name}=", value)
          end
        end

        super()
      end
    end
  end
end
