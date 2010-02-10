#!/bin/sh
# Script executed by hudson
echo "Executing $0"
echo "Running in $(pwd)"
git checkout origin/$BRANCH
rm -rf tmp/newrelic_rpm vendor/plugins/newrelic_rpm vendor/gems vendor/newrelic_rpm
mkdir -p tmp
mkdir -p log
mkdir -p vendor/gems
mkdir -p vendor/plugins

svn export http://repo.newrelic.com/rpm/projects/Agent/trunk tmp/newrelic_rpm

(cd tmp/newrelic_rpm; $RUBY -S rake build )
$RUBY -S gem install tmp/newrelic_rpm/pkg/*.gem -i vendor --no-rdoc --no-ri
export RAILS_ENV=test

$RUBY -S rake ci:setup:testunit test:newrelic || echo "Unit test failures"

