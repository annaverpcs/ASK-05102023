#Author: Alex A
  #ASK testing examples
@asktests
Feature: ASK application testing

  @predefined1
  Scenario: Student is able to choose only one option in single choice question in quiz
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    Then I type "dep8egde@sharkslasers.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "tester1" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'My Assignments')]"
    Then element with xpath "//h4[contains(text(),'My Assignments')]" should be present
    And I wait for 1 sec
    And I click on element with xpath "(//span[@class='mat-button-wrapper'])[2]"
    Then element with xpath "//h4[contains(text(),'02 Anna API Test Quiz')]" should be present
    Then I click on element with xpath "(//label[@class='mat-radio-label'])[1]"
    Then element with xpath "(//input[@type='radio'])[1]" should be selected
    Then I click on element with xpath "(//label[@class='mat-radio-label'])[2]"
    And element with xpath "(//input[@type='radio'])[1]" should not be selected
    And I wait for 2 sec


  @predefined2
  Scenario: Teacher moves option down
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    Then I type "vanih94@hulaspalmcourt.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "tester2" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for 1 sec
    Then element with xpath "//h4[contains(text(),'List of Quizzes')]" should be present
    Then I click on element with xpath "//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]"
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]/../../..//button[@class='mat-raised-button mat-primary'])[2]"
    Then I wait for 1 sec
    Then element with xpath "//input[@placeholder='Title Of The Quiz *']" should be present
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1: What is your name?')]"
    Then I wait for 1 sec
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'Q1: What is your name?')]/../../..//button[@class='mat-icon-button mat-accent'])[1]"
    Then I click on element with xpath "//span[contains(text(),'Move option down')]"
    Then I click on element with xpath "(//button[@class='mat-raised-button mat-primary ng-star-inserted'])[2]"
          #go back to the list of quizzes
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]" should contain text "001 Alex API Test Quiz"


  @predefined3
  Scenario: Teacher moves option up
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    Then I type "vanih94@hulaspalmcourt.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "tester2" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for 1 sec
    Then element with xpath "//h4[contains(text(),'List of Quizzes')]" should be present
    Then I click on element with xpath "//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]"
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]/../../..//button[@class='mat-raised-button mat-primary'])[2]"
    Then I wait for 1 sec
    Then element with xpath "//input[@placeholder='Title Of The Quiz *']" should be present
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1: What is your name?')]"
    Then I wait for 1 sec
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'Q1: What is your name?')]/../../..//button[@class='mat-icon-button mat-accent'])[1]"
    Then I click on element with xpath "//span[contains(text(),'Move option up')]"
    Then I click on element with xpath "(//button[@class='mat-raised-button mat-primary ng-star-inserted'])[2]"
          #go back to the list of quizzes
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]" should contain text "001 Alex API Test Quiz"


  @predefined4
  Scenario: Teacher adds an option (answer) to question
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    Then I type "vanih94@hulaspalmcourt.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "tester2" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for 1 sec
    Then element with xpath "//h4[contains(text(),'List of Quizzes')]" should be present
    Then I click on element with xpath "//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]"
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]/../../..//button[@class='mat-raised-button mat-primary'])[2]"
    Then I wait for 1 sec
    Then element with xpath "//input[@placeholder='Title Of The Quiz *']" should be present
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1: What is your name?')]"
    Then I wait for 1 sec
    Then I click on element with xpath "(//button[@class='mat-raised-button mat-accent'])[1]"
    Then I type "Ale" into element with xpath "(//textarea[@placeholder='Option 3*'])[1]"
    Then I click on element with xpath "(//button[@class='mat-raised-button mat-primary ng-star-inserted'])[2]"
          #go back to the list of quizzes
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]" should contain text "001 Alex API Test Quiz"
         #delete the option
    Then I click on element with xpath "//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]"
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'001 Alex API Test Quiz')]/../../..//button[@class='mat-raised-button mat-primary'])[2]"
    Then I wait for 1 sec
    Then element with xpath "//input[@placeholder='Title Of The Quiz *']" should be present
    Then I click on element with xpath "//mat-panel-title[contains(text(),'Q1: What is your name?')]"
    Then I wait for 1 sec
    Then I click on element with xpath "(//mat-panel-title[contains(text(),'Q1: What is your name?')]/../../..//button[@class='mat-icon-button mat-accent'])[3]"
    Then I click on element with xpath "//span[contains(text(),'Delete Option')]"
    Then I click on element with xpath "(//button[@class='mat-raised-button mat-primary ng-star-inserted'])[2]"
    Then I wait for 2 sec
    Then element with xpath "(//textarea[@placeholder='Option 3*'])[1]" should not be present


