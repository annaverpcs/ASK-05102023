#Author: AnnaV
@asktest
Feature: Ask application testing

  @asktest1
  Scenario: Quiz creation and deleting
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title contains "Assessment Control"
    And I type "annapcsteacher2@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345ABc" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    And I wait for 1 sec
      #add quiz title
    Then I type "0001 AnnaQuiz 0510 C" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath " //mat-icon[contains(text(),'add_circle')]"
      #select Single-Choice question
    Then I click on element with xpath "//mat-radio-button[2]"
    Then I type "Single choice question example" into element with xpath "//textarea[@formcontrolname='question']"
    Then I type "Correct answer" into element with xpath "//textarea[@placeholder='Option 1*']"
    Then I type "Incorrect answer" into element with xpath "//textarea[@placeholder='Option 2*']"
    And I click on element with xpath "//mat-radio-button[@class='mat-radio-button mat-accent'][1]"
    And I click on element with xpath " //span[contains(text(),'Save')]"
      #go back to the list of quizzes
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    Then element with xpath "//mat-panel-title[contains(text(),'0001 AnnaQuiz 0510 C')]" should contain text "0001 AnnaQuiz 0510 C"
#delete the quiz
    Then I click on element with xpath "//mat-panel-title[contains(text(),'0001 AnnaQuiz 0510 C')]"
    And I click on element with xpath "//mat-panel-title[contains(text(),'0001 AnnaQuiz 0510 C')]/../../..//button[@class='mat-raised-button mat-warn']"
    And I click on element with xpath "//div[@class='mat-dialog-actions']//span[contains(text(),'Delete')]"
    And I wait for 3 sec
    Then element with xpath "//mat-panel-title[contains(text(),'0001 AnnaQuiz 0510 C')]" should not be present
