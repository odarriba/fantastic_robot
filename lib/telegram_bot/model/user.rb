module TelegramBot
  # This object represents a Telegram user or bot.
  class Model::User < Model::Base

    attr_accessor :id, :first_name, :last_name, :username

    validates :id, :first_name, presence: true
    validates :id, numericality: true
    
  end
end
