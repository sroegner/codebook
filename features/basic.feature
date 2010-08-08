Feature: Authentication
  To make sure there is no data entered or read unauthorized
  Only authenticated users
  Should be able to view or enter data

    Scenario: Anonymous user does not see the link to the plugin
      Given I am an anonymous user
      And I am on the home page
      Then I should not see the link to Codebook

    Scenario: Authenticated user sees plugin home page
      Given I am logged in
      And I am on the home page
      Then I should see the link to Codebook


