Feature: Creation of Survey

  Background:
    Given there is a Surveys server

  Scenario: create a survey
    Given I have an empty survey payload
    When I POST its payload to the /survey endpoint
    Then I receive a 400 status code

  Scenario: create a survey
    Given I have a survey with the mandatory properties set
    When I POST its payload to the /survey endpoint
    Then I receive a 201 status code

  Scenario: create a survey with wrong content type payload
    Given I have a wrong content type survey payload
    When I custom POST it to the /survey endpoint
    Then I receive a 415 status code

  Scenario: create a wrong survey with wrong body
    Given I have a survey payload without user
    When I custom POST it to the /survey endpoint
    Then I receive a 400 status code

  Scenario: create a survey with wrong user type
    Given I have a survey payload with wrong user type
    When I custom POST it to the /survey endpoint
    Then I receive a 400 status code

  Scenario: create a survey with correct questions numbers
    Given I have a survey payload with correct questions numbers
    When I POST its payload to the /survey endpoint
    Then I receive a 201 status code

  Scenario: create a survey with first question not zero
    Given I have a survey payload with first question not zero
    When I POST its payload to the /survey endpoint
    Then I receive a 460 status code

  Scenario: create a survey with wrong questions numbers
    Given I have a survey payload with not consecutive questions numbers
    When I POST its payload to the /survey endpoint
    Then I receive a 461 status code