# A sample Gemfile
source :gemcutter

gem "test-unit"

gem "rails", "2.3.11"

gem "ci_reporter", :git => 'git://github.com/newrelic/ci_reporter.git'
gem "mocha", "0.9.8"
gem "shoulda"
gem "jeweler", "1.4.0"
gem "gemcutter", "0.5.0"
gem 'rack'
gem 'rack-test'

gem "newrelic_rpm", :path => '../ruby_agent'

if(RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
else
  gem "mysql", RUBY_VERSION == '1.8.6' ? '2.7' : '2.8.1'
  gem "sqlite3-ruby", "1.2.5"
end

