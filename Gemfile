source 'http://rubygems.org'

gem 'test-unit','2.3.2'
gem 'rails', '~>3.2.0'
gem 'newrelic_rpm', :path => '../ruby_agent'
gem "ci_reporter", :git => 'git://github.com/newrelic/ci_reporter.git'
gem "mocha"
gem 'shoulda'
gem 'rack'
gem 'rack-test'

if (RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter", "~>1.2.9"
  gem "activerecord-jdbcsqlite3-adapter", "~>1.2.9"
  gem "jruby-openssl"
else
  gem "mysql"
  #gem "sqlite3-ruby"
  gem "sqlite3"
end

gem 'sequel', '~> 3.46.0'
