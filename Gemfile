source 'http://rubygems.org'

gem 'test-unit','2.3.2'
gem 'rails', '~>3.2.0'
gem 'newrelic_rpm', :path => '../ruby_agent'
gem "mocha"
gem 'shoulda'
gem 'rack'
gem 'rack-test'

if (RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl", '0.8.2'
else
  gem "mysql2"
  gem "sqlite3"
end

gem 'sidekiq'
