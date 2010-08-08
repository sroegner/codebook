Before do
  User.destroy_all
  # Setting.stubs(:plugin_codebook).returns({'show_line_numbers' => 1})
  @current_user = Factory(:user)
  @p = path_to('the plugin home page')
end


Given /^I am an anonymous user$/ do
  visit signout_path
end

Given /^I am logged in$/ do
  User.stubs(:current).returns(@current_user)
end

Then /^I should not see the link to Codebook$/ do
  response_body.should_not have_selector("a[href='#{@p}']") do |element|
    element.should_not contain('Share Code')
  end
end

Then /^I should see the link to Codebook$/ do
  response_body.should have_selector("a[href='#{@p}']") do |element|
    element.should contain('Share Code')
  end
end
