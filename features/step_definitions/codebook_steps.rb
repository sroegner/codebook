Given /^I am an anonymous user$/ do
  visit signout_path
end

Given /^I am logged in$/ do
  @user = Factory(:user)
  @user.register!
  @user.activate!
  User.stubs(:current).returns(@user)  
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
