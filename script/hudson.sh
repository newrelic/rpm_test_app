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

rvm --create $RUBY@rails23_agent_tests

rvm --force gemset empty rails23_agent_tests

export RAILS_ENV=test

bundle update
rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

