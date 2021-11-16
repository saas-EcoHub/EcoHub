Given /^the following users exist:$/ do |users_table|
    users_table.hashes.each do |user|
        User.create! user
    end
end

Given /^I am logged in as "([^"]*)" with password "([^\"]*)"$/ do |email,password|
    step %{I follow "Login"}
    step %{I fill in "Email" with "#{email}"}
    step %{I fill in "Password" with "#{password}"}
    step %{I press "Sign In"}
end