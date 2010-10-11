Feature: Visit
  To make sure there is no data entered or read unauthorized
  Only authenticated users
  Should be able to view or enter data

    Scenario: Authenticated user sees plugin home page
      Given I am logged in
      And I am on the home page
      Then I should see the link to Codebook


