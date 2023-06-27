#Author: Yuliya Lesyuk
  #ASK app
  @asktests
  Feature: ASK test

    @asktest1
    Scenario: Quiz creation and deleting
      Given I open url "http://ask-int.portnov.com/#/login"
      Then I should see page title contains "Assessment Control"
      Then I type "maturamyroslav@gmail.com" into element with xpath "//input[@formcontrolname='email']"
      And I type "qa123" into element with xpath "//input[@formcontrolname='password']"
      And I click on element with xpath "//button[@type='submit']"
      Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
      Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
      Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
      And I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
      Then I type "!!!!!!" into element with xpath "//input[@formcontrolname='name']"
      And I click on element with xpath "//mat-accordion[@formarrayname='questions']"
      And I click on element with xpath "//mat-radio-button[@id='mat-radio-8']"
      Then I type "123" into element with xpath "//mat-radio-button[@id='mat-radio-8']"
      

    @asktest2
    Scenario: Student registration
      Given I open url "http://ask-int.portnov.com/#/login"
      And I type "yu" into element with xpath "//input[@formcontrolname='firstName']"
      And I type "le" into element with xpath "//input[@formcontrolname='lastName']"
      And I type "123@gmail.com" into element with xpath "//input[@formcontrolname='email']"
      And I type "0510" into element with xpath "//input[@formcontrolname='group']"
      And I type "12345" into element with xpath "//input[@formcontrolname='password']"
      And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"
      Then I click on element with xpath "//span[contains(text(),'Register Me')]"
      Then YL retrieve information from db for email "123@gmail.com"
