# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RpmTestApp::Application.initialize!
Sequel::Model.db.extension( :newrelic_instrumentation )