source 'http://rubygems.org'

gem 'test-unit'
gem 'rails', '~>3.0.0'
gem 'newrelic_rpm', :path => '../ruby_agent'
gem "ci_reporter", :git => 'git://github.com/newrelic/ci_reporter.git'
gem "mocha"
gem "jeweler"
gem 'shoulda'
gem 'rack'
gem 'rack-test'

if (RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter", '1.1.2'
  gem "activerecord-jdbcsqlite3-adapter", '1.1.2'
  gem "jruby-openssl"
else
  gem "mysql"
  gem "sqlite3-ruby"
end
