#Author : Olga Viron
  #Ask testing examples
  Feature: ASK test

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

      


        #@asktest3
        Scenario: Registration
          Given I open url "http://ask-int.portnov.com/#/registration"
          And I type "Cat" into element with xpath "//input[@placeholder='First Name']"
          And I type "Dog" into element with xpath "//input[@placeholder='Last Name']"
          And I type "Catdog@gmail.com" into element with xpath "//input[@placeholder='Email']"
          And I type "<string>" into element with xpath "//input[@placeholder='Group code']"
          And I type "<string>" into element with xpath "//input[@placeholder='Password']"
          And I type "<string>" into element with xpath "//input[@placeholder='Confirm Password']"
Then I click on element with xpath "//span[contains(text(),'Register Me')]"

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
