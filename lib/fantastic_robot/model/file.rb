module FantasticRobot
  # This object represents a file.
  class Model::File < Model::Base

    attr_accessor :file_id, :file_size, :file_path

    validates :file_id, presence: true
    validates :file_size, numericality: true, allow_blank: true

    def self.file
      FantasticRobot.connection.get_by_path(self.file_path) unless self.file_path.blank?
    end
  end
end
