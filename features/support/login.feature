Feature: Login me
    In order to login
    A user
    Should enter valide email and password on form
 
    Scenario: Login use
        Given I am on the login page
        And I fill in "email" with "ttt@gmail.com"
        And I fill in "password" with "ttt"
        When I press "login button"
        Then page should have notice message "Your message was successfully delivered."