#!/bin/sh -ex

for version in 2.3.7 2.4.4 2.5.1 2.3.7-slim 2.4.4-slim 2.5.1-slim
do
  docker pull nyulibraries/selenium_chrome_headless_ruby:$version
done
