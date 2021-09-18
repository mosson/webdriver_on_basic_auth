#! /usr/bin/env ruby

require "bundler/inline"
gemfile do
  gem "selenium-webdriver"
  gem "byebug"
  gem "base64"
end

basic_authorization = Base64.strict_encode64("hoge:fuga")

driver = Selenium::WebDriver.for :chrome

# set custom request header(s)
driver.execute_cdp("Network.enable")
driver.execute_cdp(
  "Network.setExtraHTTPHeaders",
  "headers" => { "Authorization" => "Basic #{basic_authorization}" },
)

driver.navigate.to "http://localhost:8000"

byebug

driver.close
