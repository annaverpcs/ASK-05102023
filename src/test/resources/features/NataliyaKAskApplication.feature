#Author : Nataliya K
#ASK testing

  @asktests
  Feature: ASK test
    
  @asktest1
  Scenario: Quiz creation and deleting
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    And I type "anjolea@sharkslasers.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "123456" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    And I wait for 1 sec
    # add quiz title
    Then I type "TA Quiz NataK" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    # select Single-Choice question
    Then I click on element with xpath "//mat-radio-button[2]"
    Then I type "TA Single-Choice question" into element with xpath "//textarea[@formcontrolname='question']"
    Then I type "Correct answer" into element with xpath "//textarea[@placeholder='Option 1*']"
    Then I type "Incorrect answer" into element with xpath "//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//mat-radio-button[@class='mat-radio-button mat-accent'][1]"
    And I click on element with xpath "//span[contains(text(),'Save')]"
    # go to the list of quizzes
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'TA Quiz NataK')]" should contain text "TA Quiz NataK"
    # delete the quiz
    Then I click on element with xpath "//mat-panel-title[contains(text(),'TA Quiz NataK')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'TA Quiz NataK')]/../../..//button[@class='mat-raised-button mat-warn']"
    And I click on element with xpath "//div[@class='mat-dialog-actions']//span[contains(text(), 'Delete')]"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(),'TA Quiz NataK')]" should not be present
    #And I wait for 5 sec



  @asktest2
  Scenario: Student registration
    Given I open url "http://ask-int.portnov.com/#/registration"
    And I type "First" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "Last" into element with xpath "//input[@formcontrolname='lastName']"
    And I type "email@email.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "ABC" into element with xpath "//input[@formcontrolname='group']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"
    Then I click on element with xpath "//span[contains(text(),'Register Me')]"
    Then AV retrieve information from db for email "email@email.com"






