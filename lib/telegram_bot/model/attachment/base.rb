module TelegramBot
  module Model
    module Attachment
      class Model::Attachment::Base < Model::Base
        # Function to get the file attached (if there is any)
        def get_file
          unless (self.file_id.blank?)
            request = TelegramBot::Request::GetFile(file_id: self.file_id)
            response = TelegramBot::Model::File.new(JSON.parse(request.api_call))
          end
        end
      end
    end
  end
end
