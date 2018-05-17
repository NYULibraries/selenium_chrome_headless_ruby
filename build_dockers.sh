#!/bin/bash -ex

docker build . --build-arg RUBY_VERSION=2.4 -t nyulibraries/selenium_chrome_headless_ruby:2.4
docker build . --build-arg RUBY_VERSION=2.5 -t nyulibraries/selenium_chrome_headless_ruby:2.5
docker push nyulibraries/selenium_chrome_headless_ruby:2.4
docker push nyulibraries/selenium_chrome_headless_ruby:2.5
