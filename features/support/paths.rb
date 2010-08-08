module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      home_path
#    when /the sign up page/i
#      sign_up_path
    when /the sign in page/i
      signin_path

    when /the plugin home page/i
       '/codebook'
#    when /the password reset request page/i
#      new_password_path

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)