Feature: AddDefaultData
  To give an idea of how to use the plugin
  A user
  Should be able to import basic data

    Scenario: Authenticated user sees plugin home page
      Given I am on the Homepage
      And I follow the codebook link in the top menu
      Then I should see "Codebook Menu"
      And I should see "Codebook Dashboard"
      And I should see "Sign in"

