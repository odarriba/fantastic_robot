require 'spec_helper'

module TelegramBot
  module Model
    describe Base do
      it_behaves_like "model with attributes", :base
    end
  end
end
