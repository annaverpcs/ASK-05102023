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

#Student registration and activation
  @asktest2
  Scenario: Student registration
    Given I open url "http://ask-int.portnov.com/#/registration"
    And I type "First" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "Last" into element with xpath "//input[@formcontrolname='lastName']"
    And I type "abc@email.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "XYZ" into element with xpath "//input[@formcontrolname='group']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"
    Then I click on element with xpath "//span[contains(text(),'Register Me')]"
    Then AV retrieve information from db for email "abc@email.com"
    Then AV activate the user
    Then AV retrieve information from db for email "abc@email.com"

  #Student registration and activation - Data Driven scenario
  @asktest3
  Scenario Outline: Student registration
    Given I open url "http://ask-int.portnov.com/#/registration"
    And I type "<sFirstName>" into element with xpath "//input[@formcontrolname='firstName']"
    And I type "<sLastName>" into element with xpath "//input[@formcontrolname='lastName']"
    And I type "<sEmail>" into element with xpath "//input[@formcontrolname='email']"
    And I type "<sGroup>" into element with xpath "//input[@formcontrolname='group']"
    And I type "<sPassword>" into element with xpath "//input[@formcontrolname='password']"
    And I type "<sConfirmPassword>" into element with xpath "//input[@formcontrolname='confirmPassword']"
    Then I click on element with xpath "//span[contains(text(),'Register Me')]"
    Then AV retrieve information from db for email <sEmailAddress>
    Then AV activate the user
    Then AV retrieve information from db for email <sEmailAddress>
    Examples:
      | sFirstName | sLastName | sEmail              | sGroup | sPassword | sConfirmPassword | sEmailAddress         |
      | First      | Last      | abc1@email.com      | XYZ    | 12345     | 12345            | "abc1@email.com"      |
      | John       | Smith     | johnSmith@email.com | ABC12  | 12345     | 12345            | "johnSmith@email.com" |

    #Student registration and activation - Data Driven scenario with XpathLibrary and Custom methods from AnnaVStepdefs
  @asktest3
  Scenario Outline: Student registration
    Given AV open "ASK Registraion"
    And AV type "<sFirstName>" into element with xpath "FirstNameXpath"
    And AV type "<sLastName>" into element with xpath "LastNameXpath"
    And AV type "<sEmail>" into element with xpath "EmailXpath"
    And AV type "<sGroup>" into element with xpath "GroupXpath"
    And AV type "<sPassword>" into element with xpath "PasswordXpath"
    And AV type "<sConfirmPassword>" into element with xpath "ConfirmPasswordXpath"
    Then AV click on button "RegisterMe"
    Then AV retrieve information from db for email <sEmailAddress>
    Then AV activate the user
    Then AV retrieve information from db for email <sEmailAddress>
    Examples:
      | sFirstName | sLastName | sEmail          | sGroup | sPassword | sConfirmPassword | sEmailAddress     |
      | First      | Last      | abc10@email.com | XYZ    | 12345     | 12345            | "abc10@email.com" |
