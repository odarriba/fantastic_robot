require 'test_helper'

class TelegramBotTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TelegramBot::VERSION
  end
end
