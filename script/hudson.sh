#!/bin/bash
# Script executed by hudson
BRANCH=integration
if [ $# == 1 ] ; then
  BRANCH=$1
fi
echo "Executing $0 on branch $BRANCH"
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

gem install rails --version=2.0.2 --no-rdoc --no-ri

gem install jeweler bundler shoulda mocha rack ci_reporter --no-rdoc --no-ri

bundle config build.mysql --with-mysql-config=`which mysql_config`
bundle install

git clone chi-repo.newrelic.com:/git/ruby_agent.git vendor/plugins/newrelic_rpm

(cd vendor/plugins/newrelic_rpm; git checkout -b $BRANCH origin/$BRANCH ; rake build )
export RAILS_ENV=test

rake gems:install
rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

