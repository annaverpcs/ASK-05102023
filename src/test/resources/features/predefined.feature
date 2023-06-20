@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//textarea[@name='q']" should be present
    When I type "Cucumber" into element with xpath "//textarea[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

  @asktest1
    Scenario: Quiz creation and deleting
      Given I open url "http://ask-int.portnov.com/#/login"
      And I should see page title contains "Assessment Control"
      Then I type "volhateacher@gmail.com" into element with xpath "//input[@formcontrolname='email']"
      Then I type "Dusia123!" into element with xpath "//input[@formcontrolname='password']"
      And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then  I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    And I wait for 1 sec
    Then I type "VOlhaV Quiz" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath "//mat-icon[contains(text(),'add_circle')]"
    #single choice question
  Then I click on element with xpath "//mat-radio-button[2]"
    And I type "First Question" into element with xpath "//textarea[@formcontrolname='question']"
    And I type "First" into element with xpath "//textarea[@placeholder='Option 1*']"
    And I type "Second" into element with xpath "//textarea[@placeholder='Option 2*']"
    Then I click on element with xpath "//mat-radio-button[@class='mat-radio-button mat-accent'][1]"
    And I click on element with xpath "//span[contains(text(),'Save')]"
    And I wait for 2 sec
#going back to quizzes
  Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And element with xpath "//h4[contains(text(),'List of Quizzes')]" should contain text "VOlhaV Quiz"
