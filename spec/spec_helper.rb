require 'rubygems'
require 'pry'

#%w(filterset filter action condition).each do |entity|
%w(filterset).each do |entity|
  require_relative "../lib/"+entity
end

RSpec.configure do |config|
  config.filter_run_excluding :broken => true
  config.mock_with :rspec
end