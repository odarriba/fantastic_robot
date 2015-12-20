require 'test_helper'

class TelegramBotTest < Minitest::Test
  def version_available
    refute_nil ::TelegramBot::VERSION
  end
end
