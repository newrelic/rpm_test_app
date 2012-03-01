# A sample Gemfile
source :gemcutter

# gem "rails", "2.3.4"
# gem "rails", "2.0.2"
# gem "rails", "2.1.2"
gem "rails", "2.2.2"

gem "ci_reporter", "1.6.0"
gem "mocha", "0.9.8"
gem "jeweler", "1.4.0"
gem "gemcutter", "0.5.0"
gem 'rack'
gem 'rack-test'
gem 'newrelic_rpm'

if (RUBY_PLATFORM == 'java')

gem "activerecord-jdbcmysql-adapter"

else

if RUBY_VERSION == '1.8.6'
  gem "mysql", '2.7'
  gem 'shoulda', '~> 2.11.3'
else
  gem "mysql",  '2.8.1'
  gem 'shoulda', '~> 3.0.0'
end
gem "sqlite3-ruby", "1.2.5"

end

