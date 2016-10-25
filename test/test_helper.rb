require 'factory_girl'
require 'faker'
require 'fantastic_robot'

# Fix deprecation message
ActiveSupport.test_order = :random if ActiveSupport.respond_to? :test_order

# Load support files
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

# Load factories for models
Dir[File.expand_path('../factories/**/*.rb', __FILE__)].each { |f| require f }

# Load test code
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# Run!
require 'minitest/autorun'
require 'minitest/pride'
