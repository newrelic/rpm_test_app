source 'http://rubygems.org'

gem 'test-unit', '2.3.2'

gem 'rails', '~>4.0.0.beta1'

gem "mocha"
gem 'shoulda'
gem 'rack'
gem 'rack-test'

platforms :jruby do
  gem "activerecord-jdbcmysql-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
end

platforms :mri_19, :mri_20, :rbx do
  gem 'activerecord-mysql-adapter'
  gem "mysql"
  gem "sqlite3-ruby"
  gem "sqlite3"
end

gem "newrelic_rpm", :path => "../ruby_agent"

