source 'http://rubygems.org'

gem 'test-unit'
gem 'rails', '3.0.4'
gem 'newrelic_rpm', :git => 'repo.newrelic.com:/git/ruby_agent.git', :branch => 'integration'
gem "ci_reporter", "1.6.4"
gem "mocha"
gem "jeweler"
gem 'shoulda'

if defined? JRuby

gem "jdbc-sqlite3"
gem "activerecord-jdbcsqlite3-adapter"

else

gem "mysql"
gem "sqlite3-ruby"

end

