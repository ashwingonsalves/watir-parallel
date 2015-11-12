When /^I search Bing for (.*)$/ do |term|
  @browser.text_field(name: "q").set term
  @browser.button(id: "sb_form_go").click
end

Then /^I should see (.*) at Bing search results$/ do |term|
  #@browser.link(text: term).should exist
  @browser.link(text: term).when_present.should exist
end
