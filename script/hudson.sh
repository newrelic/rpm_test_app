#!/bin/bash
# Script executed by hudson
echo "Executing $0"
echo "Running in $(pwd)"
rm -rf tmp/newrelic_rpm vendor/plugins/newrelic_rpm vendor/gems vendor/newrelic_rpm
mkdir -p tmp
mkdir -p log
mkdir -p vendor/gems
mkdir -p vendor/plugins

echo "source ~/.rvm/scripts/rvm"
source ~/.rvm/scripts/rvm
echo "rvm use"; echo $RUBY
rvm use $RUBY
echo 'using ruby:'
echo `which ruby`
echo "bundle update"
bundle update
echo "export RAILS_ENV=test"
export RAILS_ENV=test

bundle exec rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

