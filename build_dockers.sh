#!/bin/sh -ex

docker-compose build

docker tag selenium_chrome_headless_ruby:2.3.7 nyulibraries/selenium_chrome_headless_ruby:2.3.7
docker tag selenium_chrome_headless_ruby:2.4.4 nyulibraries/selenium_chrome_headless_ruby:2.4.4
docker tag selenium_chrome_headless_ruby:2.5.1 nyulibraries/selenium_chrome_headless_ruby:2.5.1
docker tag selenium_chrome_headless_ruby:2.3.7-slim nyulibraries/selenium_chrome_headless_ruby:2.3.7-slim
docker tag selenium_chrome_headless_ruby:2.4.4-slim nyulibraries/selenium_chrome_headless_ruby:2.4.4-slim
docker tag selenium_chrome_headless_ruby:2.5.1-slim nyulibraries/selenium_chrome_headless_ruby:2.5.1-slim

docker push nyulibraries/selenium_chrome_headless_ruby:2.3.7
docker push nyulibraries/selenium_chrome_headless_ruby:2.4.4
docker push nyulibraries/selenium_chrome_headless_ruby:2.5.1
docker push nyulibraries/selenium_chrome_headless_ruby:2.3.7-slim
docker push nyulibraries/selenium_chrome_headless_ruby:2.4.4-slim
docker push nyulibraries/selenium_chrome_headless_ruby:2.5.1-slim
