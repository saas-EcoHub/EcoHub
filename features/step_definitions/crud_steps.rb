require 'uri'
require 'cgi'

Given /^the following promotions exist:$/ do |promotions_table|
    datas = promotions_table.hashes
    datas.each do |data|
        step %{I follow "Add a new promotion"}
        step %{I fill in "Keyword" with "#{data['keyword']}"}
        step %{I fill in "Source" with "#{data['source']}"}
        step %{I select "#{data['category']}" from "Category"}
        dates = data['expdate'].split("-")
        step %{I select "#{dates[0]}" from "promotion_expdate_1i"}
        step %{I select "#{dates[1]}" from "promotion_expdate_2i"}
        step %{I select "#{dates[2]}" from "promotion_expdate_3i"}
        step %{I press "Create Promotion"}
    end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

Then /^I should see all the promotions$/ do
    Promotion.all.each do |promotion|
        step %{I should see "#{promotion.keyword}"}
    end
end

When /^I follow "([^\"]*)"$/ do |button|
    click_link(button)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
    click_button(button)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
        current_path.should == path_to(page_name)
    else
        assert_equal path_to(page_name), current_path
    end
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field,value|
    fill_in(field, with: value)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
    select(value, :from => field)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
    if page.respond_to? :should
        page.should have_content(text)
    else
        assert page.has_content?(text)
    end
end


Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
    regexp = Regexp.new(regexp)

    if page.respond_to? :should
        page.should have_xpath('//*', :text => regexp)
    else
        assert page.has_xpath?('//*', :text => regexp)
    end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
    if page.respond_to? :should
        page.should have_no_content(text)
    else
        assert page.has_no_content?(text)
    end
end