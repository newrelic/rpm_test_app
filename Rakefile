# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

RpmTestApp::Application.load_tasks
begin
  require 'ci/reporter/rake/test_unit'
  require 'ci/reporter/rake/rspec'
rescue Exception => e
  puts 'not using CI gem'
end


require 'tasks/all'

