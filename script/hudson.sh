#!/bin/bash
# Script executed by hudson
echo "Executing $0"
echo "Running in $(pwd)"
rm -rf tmp/newrelic_rpm vendor/plugins/newrelic_rpm vendor/gems vendor/newrelic_rpm
mkdir -p tmp
mkdir -p log
mkdir -p vendor/gems
mkdir -p vendor/plugins

rvm $RUBY

svn export http://repo.newrelic.com/rpm/projects/Agent/trunk tmp/newrelic_rpm
#if [ $BRANCH == "rails30" ]; then
#  rake rails:unfreeze
#  rake rails:freeze:edge
#fi
(cd tmp/newrelic_rpm; $RUBY -S rake build )
gem install tmp/newrelic_rpm/pkg/*.gem -i vendor --no-rdoc --no-ri
export RAILS_ENV=test

rake --trace ci:setup:testunit test:newrelic || echo "Unit test failures"

