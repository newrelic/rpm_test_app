source 'http://rubygems.org'

gem 'test-unit','2.3.2'

gem 'rails', '~>4.0.0.beta1'
gem 'activerecord-deprecated_finders', :github => 'rails/activerecord-deprecated_finders'
gem 'journey', :github => 'rails/journey'
gem 'activerecord-mysql-adapter'

gem "mocha"
gem 'shoulda'
gem 'rack'
gem 'rack-test'

if (RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
else
  gem "mysql"
  #gem "sqlite3-ruby"
  gem "sqlite3"
end
gem "newrelic_rpm", :path => "../ruby_agent"
gem "sqlite3-ruby"
