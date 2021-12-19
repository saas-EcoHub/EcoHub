And /^I like this comment$/ do
    find(:xpath, ".//a[i[contains(@class, 'fa fa-sort-up fa-2x mt-3 hit-voting')]]").click
end

And /^I dislike this comment$/ do
    find(:xpath, ".//a[i[contains(@class, 'fa fa-sort-down fa-2x mt-3 hit-voting')]]").click
end