require 'factory_girl'
require 'faker'
require 'telegram_bot'

# Load support files
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

# Load factories for models
Dir[File.expand_path('../factories/**/*.rb', __FILE__)].each { |f| require f }

# Load test code
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# Run!
require 'minitest/autorun'
require 'minitest/pride'
