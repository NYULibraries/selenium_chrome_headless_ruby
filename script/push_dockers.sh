#!/bin/sh -ex

for version in 2.3.7 2.4.4 2.5.1 2.3.7-slim 2.4.4-slim 2.5.1-slim
do
  docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_69-${CIRCLE_BRANCH//\//_}
  docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_69-${CIRCLE_BRANCH//\//_}-${CIRCLE_SHA1}
  if [[ "$CIRCLE_BRANCH" = "master" ]]
  then
    docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_69
    # also tag with short version, which excludes patch version number
    short_version=`echo $version | sed -e 's/\..$//g' | sed -e 's/\..-/-/g'`
    docker tag selenium_chrome_headless_ruby:$version quay.io/nyulibraries/selenium_chrome_headless_ruby:$short_version-chrome_69
  fi
done

for version in 2.3.7 2.4.4 2.5.1 2.3.7-slim 2.4.4-slim 2.5.1-slim
do
  docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_69-${CIRCLE_BRANCH//\//_}
  docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_69-${CIRCLE_BRANCH//\//_}-${CIRCLE_SHA1}
  if [[ "$CIRCLE_BRANCH" = "master" ]]
  then
    docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$version-chrome_69
    short_version=`echo $version | sed -e 's/\..$//g' | sed -e 's/\..-/-/g'`
    docker push quay.io/nyulibraries/selenium_chrome_headless_ruby:$short_version-chrome_69
  fi
done
