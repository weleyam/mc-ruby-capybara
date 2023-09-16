@login
Feature: login page

  @test1
  Scenario: success login with correct credentials
    Given I am on the homepage
    When I click  sign in
    And I fill my credentials
    Then I should be logged in

  @test2
  Scenario: success login with correct credentials (using parameter)
    Given I am on the homepage
    When I click  sign in
    And I enter username as "wele.testing@gmail.com"
    And I enter password as "abc123"
    And I click button login
    Then I should be logged in

  @test3
  Scenario Outline: success login with correct credentials (using example)
    Given I am on the homepage
    When I click  sign in
    And I enter username as "<username>"
    And I enter password as "<password>"
    And I click button login
    Then I should be logged in

    Examples: 
      | username                | password |
      | wele.testing@gmail.com  | abc123   |
      | wele.testing2@gmail.com | xyz345   |
