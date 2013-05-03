# A sample Gemfile
source :gemcutter

gem "rails", "2.1.2"

gem "ci_reporter", "1.6.0"
gem "mocha", "0.9.8"
gem 'shoulda'
gem "jeweler", "1.4.0"
gem "gemcutter", "0.5.0"
gem 'rack'
gem 'rack-test'
gem 'newrelic_rpm'

if (RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter"
  gem "jruby-openssl"
else
  gem "mysql", RUBY_VERSION == '1.8.6' ? '2.7' : '2.8.1'
  gem "sqlite3-ruby", "1.2.5"
  gem 'sequel', '~> 3.46.0' unless RUBY_VERSION == '1.8.6'
end
