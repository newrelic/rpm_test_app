source 'http://rubygems.org'

gem 'test-unit', '2.3.2'
gem 'rake', '0.9.6'

gem 'rails', '~>4.0.0'

gem "mocha", '~>0.13.0', :require => false
gem 'shoulda'
gem 'rack'
gem 'rack-test'

platforms :jruby do
  gem "activerecord-jdbcmysql-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
end

platforms :mri_19, :mri_20, :rbx do
  gem "mysql"
  gem "sqlite3-ruby"
  gem "sqlite3"
end

platforms :rbx do
  gem 'rubysl'
  gem 'racc'
end

gem 'sequel', '~> 3.46.0'

gem "newrelic_rpm", :path => "../ruby_agent"
