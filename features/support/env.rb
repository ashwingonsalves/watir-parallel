# before all
environment = :remote # :local or :remote
username = "<username>"
api_key = "<access_key>"

require "bundler/setup"
require "watir-webdriver"

def browser_for(environment, username, api_key)
  if environment == :remote
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps[:os] = "Windows"
    caps[:browser] = "firefox"
    caps[:browser_version] = "41.0"
    caps["browserstack.debug"] = "true"
    caps[:name] = "#{environment} #{ENV['TEST_ENV_NUMBER']}"

    require "selenium/webdriver/remote/http/persistent" # :http_client
    
    Watir::Browser.new(
      :remote,
      :http_client => Selenium::WebDriver::Remote::Http::Persistent.new,
      :url => "http://#{username}:#{api_key}@hub.browserstack.com/wd/hub",
      :desired_capabilities => caps)
  else
    Watir::Browser.new :firefox
  end
end

browser = browser_for(environment, username, api_key)

Before do
  @browser = browser
end

at_exit do
  browser.close
end
