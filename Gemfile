source 'http://rubygems.org'

gem 'rake', '0.8.7'
gem 'test-unit'
gem 'rails', '3.0.4'
gem 'newrelic_rpm', :git => 'chi-repo.newrelic.com:/git/ruby_agent.git', :branch => 'integration'
gem "ci_reporter", :git => 'git://github.com/newrelic/ci_reporter.git'
gem "mocha"
gem "jeweler"
gem 'shoulda'

if (RUBY_PLATFORM == 'java')
  gem "activerecord-jdbcmysql-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
else
  gem "mysql"
  gem "sqlite3-ruby"
end

