# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

RpmTestApp::Application.load_tasks
begin
  gem 'test-unit'
  require 'test/unit'
  require 'ci/reporter/rake/test_unit'
rescue Exception => e
  puts 'not using CI gem'
end


require 'tasks/all'

