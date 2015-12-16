module TelegramBot
  # This object represents a chat.
  class Model::Chat < Model::Base

    attr_accessor :id, :type, :title, :username, :first_name, :last_name

    validates :id, :type, presence: true
    validates :id, numericality: true
    validates :type, inclusion: {in: ["private", "group", "supergroup", "channel"]}

  end
end
