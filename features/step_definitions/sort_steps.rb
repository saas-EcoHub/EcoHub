Then /^I should see "([^"]*)" before "([^"]*)"$/ do |e1, e2|
    expect(page).to have_content(~ /#{e1}.+#{e2}/m)
end