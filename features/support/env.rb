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
    caps[:os_version] = "8"
    caps[:browser] = "Firefox"
    caps[:browser_version] = "41.0"
    caps["browserstack.debug"] = "true"
    caps["acceptSslCerts"] = "true"

    caps[:name] = "#{environment} #{ENV['TEST_ENV_NUMBER']}"
    caps[:build] = "Supp_Watir_parallel"
    caps[:project] = "Supp_Watir_parallel"

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
  @browser.driver.manage.timeouts.implicit_wait = 50
end

at_exit do
  browser.close
end
