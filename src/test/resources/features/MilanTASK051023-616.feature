#Ask application test set automation for submission Actual Points
  #Author: Milan Tiwari
  #Jira Id: ASK051023-616
  @submission
  Feature: Actual points for submission
    
    @submission1
    Scenario: Teacher can see actual point after student submit the assignment
      Given I open url "http://ask-int.portnov.com/#/login"
      Then I should see page title as "Assessment Control @ Portnov"
      Then  I type "milanteacher23@gmail.com" into element with xpath "//input[@placeholder='Email *']"
      Then I type "12345" into element with xpath "//input[@placeholder='Password *']"
      Then I click on element with xpath "//span[contains(text(),'Sign In')]"
      Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
      Then element with xpath "//p[contains(text(),'TEACHER')]" should contain text "TEACHER"
      Then element with xpath "//h3[contains(text(),'Milan Teacher')]" should contain text "Milan Teacher"
      #I go to submission Page
      And I click on element with xpath "//h5[contains(text(),'Submissions')]"
      Then I wait for 3 sec
      And I click on element with xpath "//div[contains(text(),'Reviewed')]"
      Then element with xpath "//mat-tab-group[@class='mat-tab-group mat-primary']" should be present
      And I click on element using JavaScript with xpath "(//span[contains(text(),'Review')])[3]"
      Then I wait for element with xpath "//td[contains(text(),'Actual points / percentage:')]" to be present
      Then element with xpath "//td[contains(text(),'20 of 20 / 100%')]" should be present
      Then I wait for 3 sec






      

    