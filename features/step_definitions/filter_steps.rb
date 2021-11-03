When /^I (un)?check the following categories: "([^"]*)"$/ do |uncheck, cat_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb

  cat_list.strip.split(%r{\s*,\s*}).each do |cat|
    eval("#{uncheck}check(\"categories[\"+cat+\"]\")")
  end
end