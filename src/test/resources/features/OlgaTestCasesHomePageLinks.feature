#Author : Olga Viron
  #Ask testing examples
Feature: Home Page Links
  @asktest2
  Scenario: Go to submissions
    Given I open url "http://ask-int.portnov.com/#/login"
    And I should see page title contains "Assessment Control"
    Then I type "volhateacher@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "Dusia123!" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//span[contains(text(), 'Go To Submissions')]"
    And I wait for 3 sec
    Then I wait for element with xpath "//h4[contains(text(),'Submissions')]" to be present

  Scenario: Go to Assignments
    Given I open url "http://ask-int.portnov.com/#/login"
    And I should see page title contains "Assessment Control"
    Then I type "volhateacher@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "Dusia123!" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//span[contains(text(),'Go To Assignments')]"
    And I wait for 3 sec
    Then I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present

  Scenario: Go to Users Management
    Given I open url "http://ask-int.portnov.com/#/login"
    And I should see page title contains "Assessment Control"
    Then I type "volhateacher@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "Dusia123!" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//span[contains(text(),'Go To Users Management')]"
    And I wait for 3 sec
    Then I wait for element with xpath "//h4[contains(text(),'Management')]" to be present

    #Compare Homepage links with main menu option
    Scenario: Go to submissions and Submissions from menu
      Given I open url "http://ask-int.portnov.com/#/login"
      And I should see page title contains "Assessment Control"
      Then I type "volhateacher@gmail.com" into element with xpath "//input[@formcontrolname='email']"
      Then I type "Dusia123!" into element with xpath "//input[@formcontrolname='password']"
      And I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
      Then I click on element with xpath "//span[contains(text(), 'Go To Submissions')]"
      And I wait for 2 sec
      Then I wait for element with xpath "//h4[contains(text(),'Submissions')]" to be present
      Then I click on element with xpath "//mat-icon[contains(text(),'home')]"
      Then I should see page title contains "Assessment Control"
      And I click on element with xpath "//h5[contains(text(),'Submissions')]"
      Then I wait for element with xpath "//h4[contains(text(),'Submissions')]" to be present
And I wait for 2 sec

  Scenario: Go to assignments and assignments from menu
    Given I open url "http://ask-int.portnov.com/#/login"
    And I should see page title contains "Assessment Control"
    Then I type "volhateacher@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "Dusia123!" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//span[contains(text(),'Go To Assignments')]"
    And I wait for 2 sec
    Then I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    Then I click on element with xpath "//mat-icon[contains(text(),'home')]"
    Then I should see page title contains "Assessment Control"
    And I click on element with xpath "//h5[contains(text(),'Assignments')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    And I wait for 2 sec

  Scenario: Go to Users management and Users management from menu
    Given I open url "http://ask-int.portnov.com/#/login"
    And I should see page title contains "Assessment Control"
    Then I type "volhateacher@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "Dusia123!" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//span[contains(text(),'Go To Users Management')]"
    And I wait for 2 sec
    Then I wait for element with xpath "//h4[contains(text(),'Management')]" to be present
    Then I click on element with xpath "//mat-icon[contains(text(),'home')]"
    Then I should see page title contains "Assessment Control"
    And I click on element with xpath "//h5[contains(text(),'Management')]"
    Then I wait for element with xpath "//h4[contains(text(),'Management')]" to be present
    And I wait for 2 sec