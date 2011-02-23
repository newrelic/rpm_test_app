source 'http://rubygems.org'

gem 'test-unit'
gem 'rails', '3.0.4'
gem 'newrelic_rpm', :git => 'repo.newrelic.com:/git/ruby_agent.git', :branch => 'integration'
gem "ci_reporter", :git => 'git://github.com/newrelic/ci_reporter.git'
gem "mocha"
gem "jeweler"
gem 'shoulda'

if defined? JRuby

gem "activerecord-jdbcmysql-adapter"

else

gem "mysql"
gem "sqlite3-ruby"

end

