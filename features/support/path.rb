module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (EcoHub )?home\s?page$/ then '/promotions'
    
    when /^the edit page for "(.*)"$/
        edit_promotion_path(Promotion.find_by_keyword($1))
      
    when /^the details page for "(.*)"$/
        promotion_path(Promotion.find_by_keyword($1))
    
    when /^the "Create New Promotion" page$/
        new_promotion_path

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)