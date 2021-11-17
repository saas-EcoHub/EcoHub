And /^I like this promotion$/ do
    find(:xpath, ".//a[i[contains(@class, 'fa fa-sort-up fa-2x hit-voting')]]").click
end

And /^I cancel my like for this promotion$/ do
    find(:xpath, ".//a[i[contains(@class, 'fa fa-sort-up fa-2x hit-voting-done')]]").click
end

And /^I dislike this promotion$/ do
    find(:xpath, ".//a[i[contains(@class, 'fa fa-sort-down fa-2x hit-voting')]]").click
end

And /^I cancel my dislike for this promotion$/ do
    find(:xpath, ".//a[i[contains(@class, 'fa fa-sort-down fa-2x hit-voting-done')]]").click
end

Then /^I should see (.*) votes for this promotion$/ do |value|
    count = find(:xpath, ".//div[@class='container']/div[@class='d-flex flex-row align-items-center text-left comment-top p-2 bg-white border-bottom px-4']/div[@class='d-flex flex-column-reverse flex-grow-0 align-items-center votings ml-1']/span[@class='vote_count']").text
    count.should == value
end

Then /^show me the page$/ do
    save_and_open_page
end