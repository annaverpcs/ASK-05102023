

Feature: User registration

    Scenario: ID 1, Register student, activate the account through the database,
    then log into the App using it and verify, that the process went successful
      Given KY open url "ASK title page"
      And I wait for 2 sec
      And KY click on button "Register Now"
      And I wait for 2 sec

      Then element "Register Me button" should be displayed
      And element "Registration title" should be displayed

      When KY type "FirstNameTestKY" into field "First Name"
      And KY type "LastNameTestKY" into field "Last Name"
      And KY type "dragonrider97213@aelup.com" into field "Email"
      And KY type "ABC" into field "Group Code"
      And KY type "passwordTestKY" into field "Password"
      And KY type "passwordTestKY" into field "Confirm Password"

      And KY click on button "Register Me"
      And I wait for 2 sec

      Then element "You have been Registered title" should be displayed
      And element "Back to Login Page button" should be displayed

      When KY retrieve info from DB for email "dragonrider97213@aelup.com"
      And KY activate user
      And KY retrieve info from DB for email "dragonrider97213@aelup.com"
      
      And KY open url "ASK title page"
      And I wait for 2 sec
      And KY type "dragonrider97213@aelup.com" into field "Email *"
      And KY type "passwordTestKY" into field "Password *"
      And KY click on button "Sign In"
      And I wait for 5 sec
      
      Then element with xpath "//div[@class='info']/h3" should contain text "FirstNameTestKY LastNameTestKY"
      And element with xpath "//div[@class='info']/p" should contain text "STUDENT"
      And element "My Grades left menu option" should be displayed

   # TODO: add code to delete user account created in Scenario ID 1




