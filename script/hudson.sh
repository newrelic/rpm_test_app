#!/bin/sh
# Script executed by hudson
git checkout origin/$BRANCH
rm -rf tmp/newrelic_rpm vendor/plugins/newrelic_rpm vendor/gems
mkdir -p tmp
mkdir -p log
mkdir -p vendor/gems
mkdir -p vendor/plugins
if [ $BRANCH == "rails30" ]; then
  rake rails:unfreeze
  rake rails:freeze:edge
fi
svn export http://repo.newrelic.com/rpm/projects/Agent/trunk tmp/newrelic_rpm

if [ $BRANCH == "rails20" ] ; then
  mv tmp/newrelic_rpm vendor/plugins
else
  (cd tmp/newrelic_rpm; $RUBY -S rake build )
  $RUBY -S gem install vendor/newrelic_rpm/pkg/*.gem -i vendor --no-rdoc --no-ri
end
export RAILS_ENV=test
$RUBY -S rake ci:setup:testunit test:newrelic || echo "Unit test failures"

