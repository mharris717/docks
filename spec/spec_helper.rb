$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'docks'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

Docks::List.class_eval do
  def get_remote_path(path)
    dir = File.expand_path(File.dirname(__FILE__)+"/../dockerfiles")
    "#{dir}/#{path}"
  end
end
