module FantasticRobot
  # This object represents a chat.
  class Model::Chat < Model::Base

    VALID_TYPES = ["private", "group", "supergroup", "channel"]

    attr_accessor :id, :type, :title, :username, :first_name, :last_name

    validates :id, :type, presence: true
    validates :id, numericality: true
    validates :type, inclusion: {in: VALID_TYPES}

  end
end
