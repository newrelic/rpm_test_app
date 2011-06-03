#!/bin/bash
# Script executed by hudson
echo "Executing $0"
echo "Running in $(pwd)"
rm -rf tmp/newrelic_rpm vendor/plugins/newrelic_rpm vendor/gems vendor/newrelic_rpm
mkdir -p tmp
mkdir -p log
mkdir -p vendor/gems
mkdir -p vendor/plugins

source ~/.rvm/scripts/rvm

rvm $RUBY

rvm --force gemset delete rails20_agent_tests

rvm gemset create rails20_agent_tests

rvm gemset use rails20_agent_tests

gem install rails --version=2.0.2

gem install jeweler bundler shoulda mocha rack ci_reporter --no-rdoc --no-ri

bundle install

git clone chi-repo.newrelic.com:/git/ruby_agent.git tmp/newrelic_rpm

(cd tmp/newrelic_rpm; git checkout -b integration origin/integration; rake build )
gem install tmp/newrelic_rpm/pkg/*.gem --no-rdoc --no-ri
export RAILS_ENV=test

rake gems:install
rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

