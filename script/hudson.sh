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
rvm $RUBY@rails30_agent_tests --create

rvm --force gemset empty rails30_agent_tests

echo `which ruby`
bundle update
export RAILS_ENV=test

rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

