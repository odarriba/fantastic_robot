module TelegramBot
  # This object represents a phone contact.
  class Model::MessageAttachment::Contact < Model::MessageAttachment::Base
    
    attr_accessor :phone_number, :first_name, :last_name, :user_id

    validates :phone_number, :first_name, presence: true
    validates :user_id, numericality: true, unless: 'user_id.blank?'

  end
end
