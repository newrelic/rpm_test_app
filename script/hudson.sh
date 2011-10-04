#!/bin/bash
# Script executed by hudson
BRANCH=rum_2
echo "Executing $0 on branch $BRANCH"
echo "Running in $(pwd)"
rm -rf tmp/newrelic_rpm vendor/plugins/newrelic_rpm vendor/gems vendor/newrelic_rpm
mkdir -p tmp
mkdir -p log
mkdir -p vendor/gems
mkdir -p vendor/plugins

source ~/.rvm/scripts/rvm

rvm $RUBY

rvm --force gemset delete rails23_agent_tests

rvm gemset create rails23_agent_tests

rvm gemset use rails23_agent_tests

gem install bundler jeweler shoulda mocha --no-rdoc --no-ri

export RAILS_ENV=test

bundle update
rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

