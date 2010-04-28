#!/bin/bash
# Script executed by hudson
echo "Run in $(pwd)"
echo "Script is $0"

git checkout origin/$BRANCH
rm -rf tmp/newrelic_rpm vendor/plugins/newrelic_rpm vendor/gems vendor/newrelic_rpm
mkdir -p tmp
mkdir -p log
mkdir -p vendor/gems
mkdir -p vendor/plugins

rvm $RUBY

svn export http://repo.newrelic.com/rpm/projects/Agent/trunk vendor/plugins/newrelic_rpm
export RAILS_ENV=test

#rake gems:install
rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

