@login-voila
Feature: login page

@test5
  Scenario: as a user I can login at voila.id
    Given user access voila.id
    When user clicks sign in button on the landing page
    Then user will redirected to login page
    When user enters username as "test1@mailinator.com" on the login page
    And user enters password as "Testing123" on the login page
    And user clicks button sign on on the login page
    Then user success login

