# Selenium Chrome Headless with Ruby

Docker image with Selenium with Headless Chrome built on base Ruby image

## Usage

Create your dockerfile for tests, with version corresponding to desired Ruby version (2.4 and 2.5 supported):

```
# ruby 2.5.1 with selenium and headless chrome
FROM selenium_chrome_headless_ruby:2.5.1

# bundle install
WORKDIR /app
COPY Gemfile Gemfile.lock .
RUN gem install bundler && bundle install

# copy e2e tests
COPY . .

# run e2e tests on chrome headless
RUN bundle exec rake features
```

Note that chrome requires the image's `/dev/shm` to be large enough, which can be modified with the `docker run` option `--shm-size` or the docker-compose option `shm_size:`, e.g.:

```
docker run --tty=true --shm-size=1g my-image-from-selenium_chrome_headless_ruby
```

Further, your Selenium driver must be configured to run chrome with the `--no-sandbox` option. For example, in Capybara:

```
Capybara.register_driver :chrome_headless do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[ no-sandbox headless disable-gpu window-size=1280,1024]
    }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end
```
