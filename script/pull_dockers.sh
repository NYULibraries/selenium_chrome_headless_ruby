#!/bin/sh -ex

for version in $RUBY_2_4 $RUBY_2_5 $RUBY_2_6 $RUBY_2_4-slim $RUBY_2_5-slim $RUBY_2_6-slim
do
  short_version=`echo $version | sed -e 's/\..$//g' | sed -e 's/\..-/-/g'`
  docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT-${CIRCLE_BRANCH//\//_} || \
    docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT || \
    docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$short_version-chrome_$CHROME_VERSION_SHORT 
done
