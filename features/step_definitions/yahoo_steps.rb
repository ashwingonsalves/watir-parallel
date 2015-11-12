When /^I search Yahoo for (.*)$/ do |term|
  @browser.text_field(name: "p").set term
  @browser.button(id: "UHSearchWeb").click
end

Then /^I should see (.*) at Yahoo search results$/ do |term|
  #@browser.link(text: term).should exist
  @browser.link(text: term).when_present.should exist
end
