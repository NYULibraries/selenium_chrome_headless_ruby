#!/bin/sh -ex

for version in $RUBY_2_3 $RUBY_2_4 $RUBY_2_5 $RUBY_2_3-slim $RUBY_2_4-slim $RUBY_2_5-slim
do
  docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT-${CIRCLE_BRANCH//\//_}
  docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT-${CIRCLE_BRANCH//\//_}-${CIRCLE_SHA1}
  if [[ "$CIRCLE_BRANCH" = "master" ]]
  then
    docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT
    # also tag with short version, which excludes patch version number
    short_version=`echo $version | sed -e 's/\..$//g' | sed -e 's/\..-/-/g'`
    docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$short_version-chrome_$CHROME_VERSION_SHORT
  fi
done

for version in $RUBY_2_3 $RUBY_2_4 $RUBY_2_5 $RUBY_2_3-slim $RUBY_2_4-slim $RUBY_2_5-slim
do
  docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT-${CIRCLE_BRANCH//\//_}
  docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT-${CIRCLE_BRANCH//\//_}-${CIRCLE_SHA1}
  if [[ "$CIRCLE_BRANCH" = "master" ]]
  then
    docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_$CHROME_VERSION_SHORT
    short_version=`echo $version | sed -e 's/\..$//g' | sed -e 's/\..-/-/g'`
    docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$short_version-chrome_$CHROME_VERSION_SHORT
  fi
done
