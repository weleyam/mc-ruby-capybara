@login
Feature: login page

  Background: user access login page
    Given I am on the homepage
    And I click  sign in

  @test4
  Scenario: success login with correct credentials (with background)
    When I fill my credentials
    Then I should be logged in

  @test5
  Scenario: success login with correct credentials (using parameter - with background)
    And I enter username as "wele.testing@gmail.com"
    And I enter password as "abc123"
    And I click button login
    Then I should be logged in