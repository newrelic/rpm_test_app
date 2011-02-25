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

rvm --force gemset delete rails30_agent_tests

rvm gemset create rails30_agent_tests

rvm gemset use rails30_agent_tests


echo `which ruby`
bundle update
export RAILS_ENV=test

rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

