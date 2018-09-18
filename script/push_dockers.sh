#!/bin/sh -ex

for version in 2.3.7 2.4.4 2.5.1 2.3.7-slim 2.4.4-slim 2.5.1-slim
do
  docker tag selenium_chrome_headless_ruby:$version nyulibraries/selenium_chrome_headless_ruby:$version-${CIRCLE_BRANCH//\//_}
  docker tag selenium_chrome_headless_ruby:$version nyulibraries/selenium_chrome_headless_ruby:$version-${CIRCLE_BRANCH//\//_}-${CIRCLE_SHA1}
  if [[ "$CIRCLE_BRANCH" = "master" ]]
  then
    docker tag selenium_chrome_headless_ruby:$version nyulibraries/selenium_chrome_headless_ruby:$version
    # also tag with short version, which excludes patch version number
    local short_version=`echo $version | sed -e 's/\..$//g' | sed -e 's/\..-/-/g'`
    docker tag selenium_chrome_headless_ruby:$version nyulibraries/selenium_chrome_headless_ruby:$short_version
  fi
done

for version in 2.3.7 2.4.4 2.5.1 2.3.7-slim 2.4.4-slim 2.5.1-slim
do
  docker push nyulibraries/selenium_chrome_headless_ruby:$version-${CIRCLE_BRANCH//\//_}
  docker push nyulibraries/selenium_chrome_headless_ruby:$version-${CIRCLE_BRANCH//\//_}-${CIRCLE_SHA1}
  if [[ "$CIRCLE_BRANCH" = "master" ]]
  then
    docker push nyulibraries/selenium_chrome_headless_ruby:$version
    local short_version=`echo $version | sed -e 's/\..$//g' | sed -e 's/\..-/-/g'`
    docker push nyulibraries/selenium_chrome_headless_ruby:$short_version
  fi
done
