#Ask application test set automation for submission Actual Points
  #Author: Milan Tiwari
  #Jira Id: ASK051023-616
@submission
Feature: Actual points for submission


  Background:
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    Then  I type "milanteacher23@gmail.com" into element with xpath "//input[@placeholder='Email *']"
    Then I type "12345" into element with xpath "//input[@placeholder='Password *']"
    Then I click on element with xpath "//span[contains(text(),'Sign In')]"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then element with xpath "//p[contains(text(),'TEACHER')]" should contain text "TEACHER"
    Then element with xpath "//h3[contains(text(),'Milan Teacher')]" should contain text "Milan Teacher"


  @submission1
  Scenario: Teacher can see actual point after student submit the assignment
          #I go to submission Page
    And I click on element with xpath "//h5[contains(text(),'Submissions')]"
    Then I wait for 3 sec
    And I click on element with xpath "//div[contains(text(),'Reviewed')]"
    Then element with xpath "//mat-tab-group[@class='mat-tab-group mat-primary']" should be present
    And I click on element using JavaScript with xpath "(//span[contains(text(),'Review')])[3]"
    Then I wait for element with xpath "//td[contains(text(),'Actual points / percentage:')]" to be present
    Then element with xpath "//td[contains(text(),'20 of 20 / 100%')]" should be present
    Then I wait for 3 sec

  @giveAssignmentByName @PositiveTestScenario
  Scenario: Give assignment to single student
    When I click on element with xpath "//h5[contains(text(),'Assignments')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    And I click on element using JavaScript with xpath "//span[contains(text(),'Create New Assignment')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//mat-select[@placeholder='Select Quiz To Assign']"
    Then I wait for 2 sec
    Then I click on element with xpath "//span[contains(text(),'0001 Quiz from Mountain#@')]"
    Then I click on element using JavaScript with xpath "(//mat-selection-list//mat-list-option//div[@class='mat-list-text'])[20]"
    Then I click on element with xpath "//span[contains(text(),'Give Assignment')]"
         #Then i will verify new assignment is in list of the assignment

  @giveAssignmentByName1 @PositiveTestScenario
  Scenario: Give assignment to multiple student
    When I click on element with xpath "//h5[contains(text(),'Assignments')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    And I click on element using JavaScript with xpath "//span[contains(text(),'Create New Assignment')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//mat-select[@placeholder='Select Quiz To Assign']"
    Then I wait for 2 sec
    Then I click on element with xpath "//span[contains(text(),'0001 Quiz from Mountain#@')]"
    And I click on element with xpath "//span[contains(text(),'Select All')]"
    Then I click on element with xpath "//span[contains(text(),'Give Assignment')]"
      #I will verify created assignment is in the list of the assignment
    Then element with xpath "//mat-card[@class='page mat-card']" should contain text "0001 Quiz from Mountain#@"
  
  @giveAssignmentByName2 @negativeTestScenario
    Scenario: Assign assignment without quiz selection
    When I click on element with xpath "//h5[contains(text(),'Assignments')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    And I click on element using JavaScript with xpath "//span[contains(text(),'Create New Assignment')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    Then I wait for 2 sec
    And I click on element with xpath "//span[contains(text(),'Select All')]"
    Then I click on element with xpath "//span[contains(text(),'Give Assignment')]"
    Then I wait for 2 sec
    Then element with xpath "//mat-error[contains(text(),'This field is required')]" should contain text "This field is required"


  @giveAssignmentByName3 @negativeTestScenario
    Scenario: Assign assignment without selecting student name
    When I click on element with xpath "//h5[contains(text(),'Assignments')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    And I click on element using JavaScript with xpath "//span[contains(text(),'Create New Assignment')]"
    Then element with xpath "//mat-card[@class='page mat-card']" should be present
    Then I wait for 2 sec
    Then I click on element with xpath "//mat-select[@placeholder='Select Quiz To Assign']"
    Then I wait for 2 sec
    Then I click on element with xpath "//span[contains(text(),'0001 Quiz from Mountain#@')]"
    Then I click on element with xpath "//span[contains(text(),'Give Assignment')]"
    Then I wait for 2 sec
    Then element with xpath "//mat-error[contains(text(),'Select at least one Student')]" should contain text "Select at least one Student"
    













      

    