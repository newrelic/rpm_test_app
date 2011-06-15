# A sample Gemfile
source :gemcutter

gem "test-unit"

gem "rails", "2.3.11"
# gem "rails", "2.0.2"
# gem "rails", "2.1.2"
# gem "rails", "2.2.2"

gem "ci_reporter", :git => 'git://github.com/newrelic/ci_reporter.git'
gem "mocha", "0.9.8"
gem "shoulda"
gem "jeweler", "1.4.0"
gem "gemcutter", "0.5.0"

gem "newrelic_rpm", :git => 'chi-repo.newrelic.com:/git/ruby_agent.git', :branch => 'integration'

if(RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
else
  gem "mysql", "2.8.1"
  gem "sqlite3-ruby", "1.2.5"
end

