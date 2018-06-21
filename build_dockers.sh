#!/bin/sh -ex

docker build . --build-arg RUBY_VERSION=2.4 -t nyulibraries/selenium_chrome_headless_ruby:2.4
docker build . --build-arg RUBY_VERSION=2.5 -t nyulibraries/selenium_chrome_headless_ruby:2.5
docker build . -f Dockerfile.slim --build-arg RUBY_VERSION=2.4 -t nyulibraries/selenium_chrome_headless_ruby:2.4-slim
docker build . -f Dockerfile.slim --build-arg RUBY_VERSION=2.5 -t nyulibraries/selenium_chrome_headless_ruby:2.5-slim

docker push nyulibraries/selenium_chrome_headless_ruby:2.4
docker push nyulibraries/selenium_chrome_headless_ruby:2.5
docker push nyulibraries/selenium_chrome_headless_ruby:2.4-slim
docker push nyulibraries/selenium_chrome_headless_ruby:2.5-slim
