#Autor: GeorgyY
@asktest
Feature: Ask application testing

  @asktest1
  Scenario: Student: Settings - Password. The user is able to change password with valid credentials
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    And I type "guardia2@justademo.cf" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
    And I wait for 1 sec
    Then I type "GeorgYtest" into element with xpath "//input[@formcontrolname='name']"
    And I click on element with xpath " //mat-icon[contains(text(),'add_circle')]"
    Then I wait for element with xpath "//h3[contains(text(),'Passing Rate')]" to be present
    And I wait for 3 sec
    Then I move slider 10 step "left" for xpath "(//mat-slider[@role='slider'])[2]"
    And I wait for 10 sec

  @asktest2
  Scenario: Student: Settings - Password. The teacher can change the passing percentage
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    And I type "guardia2@justademo.cf" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
    And I click on element with xpath "//mat-panel-title[contains(text(),'BatAl1')]"
    Then I wait for element with xpath "//td[contains(text(),'Total Questions:')]" to be present
    And I wait for 1 sec
    And I click on element with xpath "//a[@href='#/quiz-builder/9698']"
    Then I wait for element with xpath "//h3[contains(text(),'Passing Rate')]" to be present
    And I wait for 1 sec
    Then I move slider 10 step "left" for xpath "(//mat-slider[@role='slider'])[11]"
    And I wait for 3 sec

  @asktest3
    Scenario: Student: Settings - Password. When score below a passing percentage, the assignment is defined as passed
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    And I type "guardia2@justademo.cf" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    When I click on element with xpath "//h5[contains(text(), 'Assignments')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(), 'Create New Assignment')]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'Give Assignment')]" to be present
    Given element with xpath "(//mat-selection-list//mat-list-option//div[@class='mat-list-text'])[4]" should contain text "AlexeyBatalov"
    Then I click on element with xpath "(//mat-selection-list//mat-list-option//div[@class='mat-list-text'])[4]/..//mat-pseudo-checkbox"
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(),'Select Quiz To Assign')]"
    And I click on element with xpath "//span[contains(text(),'BatAl1')]"
    And I click on element with xpath "//span[contains(text(),'Give Assignment')]"
    And I wait for 1 sec
    When I click on element with xpath "//h5[contains(text(), 'Log Out')]"
    Then I wait for element with xpath "//h1[contains(text(),'Confirmation')]" to be present
    When I click on element with xpath "//span[contains(text(),'Log Out')]"
    And I wait for 1 sec
    And I type "rteager@btcmod.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345ABc" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Settings')]"
    Then I wait for element with xpath "//h4[contains(text(),'Settings')]" to be present
    When I click on element with xpath "//h5[contains(text(), 'My Assignments')]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'My Assignments')]" to be present
    When I click on element with xpath "(//span[contains(text(),'Go To Assessment')])[1]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'BatAl1')]" to be present
    Given element with xpath "(//div//mat-card[1]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[1]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[2]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[2]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]/..//div"
    Given element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[4]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[4]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[5]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[5]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]/..//div"
    Given element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[7]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[7]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[2]/..//div"
    Given element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[9]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[9]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[10]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[10]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Submit My Answers')]"
    Then I wait for element with xpath "//h1[contains(text(),'Success!')]" to be present
    And I wait for 1 sec
    Then I click on element with xpath "//span[contains(text(),'Ok')]"
    Then I wait for element with xpath "//h4[contains(text(),'My Assignments')]" to be present
    Then I click on element with xpath "//h5[contains(text(), 'My Grades')]"
    Then I wait for element with xpath "//h4[contains(text(), 'My Grades')]" to be present
    And I wait for 1 sec
    Given element with xpath "(//div//table//tbody//tr[@class='ng-star-inserted'])[last()]" should contain text "PASSED"

  @asktest4
  Scenario: Student: Settings - Password. When score below a passing percentage, the assignment is defined as failed
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    And I type "guardia2@justademo.cf" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    When I click on element with xpath "//h5[contains(text(), 'Assignments')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(), 'Create New Assignment')]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'Give Assignment')]" to be present
    Given element with xpath "(//mat-selection-list//mat-list-option//div[@class='mat-list-text'])[4]" should contain text "AlexeyBatalov"
    Then I click on element with xpath "(//mat-selection-list//mat-list-option//div[@class='mat-list-text'])[4]/..//mat-pseudo-checkbox"
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(),'Select Quiz To Assign')]"
    And I click on element with xpath "//span[contains(text(),'BatAl1')]"
    And I click on element with xpath "//span[contains(text(),'Give Assignment')]"
    And I wait for 1 sec
    When I click on element with xpath "//h5[contains(text(), 'Log Out')]"
    Then I wait for element with xpath "//h1[contains(text(),'Confirmation')]" to be present
    When I click on element with xpath "//span[contains(text(),'Log Out')]"
    And I wait for 1 sec
    And I type "rteager@btcmod.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345ABc" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Settings')]"
    Then I wait for element with xpath "//h4[contains(text(),'Settings')]" to be present
    When I click on element with xpath "//h5[contains(text(), 'My Assignments')]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'My Assignments')]" to be present
    When I click on element with xpath "(//span[contains(text(),'Go To Assessment')])[1]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'BatAl1')]" to be present
    Given element with xpath "(//div//mat-card[1]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[1]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[2]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[2]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]/..//div"
    Given element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[4]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[4]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[5]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[5]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]/..//div"
    Given element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[7]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[7]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[2]/..//div"
    Given element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[9]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[9]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[10]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[10]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]/..//div"
    And I wait for 3 sec
    When I click on element with xpath "//span[contains(text(),'Submit My Answers')]"
    Then I wait for element with xpath "//h1[contains(text(),'Success!')]" to be present
    And I wait for 1 sec
    Then I click on element with xpath "//span[contains(text(),'Ok')]"
    Then I wait for element with xpath "//h4[contains(text(),'My Assignments')]" to be present
    Then I click on element with xpath "//h5[contains(text(), 'My Grades')]"
    Then I wait for element with xpath "//h4[contains(text(), 'My Grades')]" to be present
    And I wait for 1 sec
    Given element with xpath "(//div//table//tbody//tr[@class='ng-star-inserted'])[last()]" should contain text "FAILED"

  @asktest5
  Scenario: Student: Settings - Password. The correctness of the status determination at the boundary value of Actual points / percentage
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I should see page title as "Assessment Control @ Portnov"
    And I type "guardia2@justademo.cf" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
    When I click on element with xpath "//h5[contains(text(), 'Assignments')]"
    Then I wait for element with xpath "//h4[contains(text(),'List of Assignments')]" to be present
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(), 'Create New Assignment')]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'Give Assignment')]" to be present
    Given element with xpath "(//mat-selection-list//mat-list-option//div[@class='mat-list-text'])[4]" should contain text "AlexeyBatalov"
    Then I click on element with xpath "(//mat-selection-list//mat-list-option//div[@class='mat-list-text'])[4]/..//mat-pseudo-checkbox"
    And I wait for 1 sec
    And I click on element with xpath "//span[contains(text(),'Select Quiz To Assign')]"
    And I click on element with xpath "//span[contains(text(),'BatAl1')]"
    And I click on element with xpath "//span[contains(text(),'Give Assignment')]"
    And I wait for 1 sec
    When I click on element with xpath "//h5[contains(text(), 'Log Out')]"
    Then I wait for element with xpath "//h1[contains(text(),'Confirmation')]" to be present
    When I click on element with xpath "//span[contains(text(),'Log Out')]"
    And I wait for 1 sec
    And I type "rteager@btcmod.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345ABc" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//button[@type='submit']"
    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
    Then I click on element with xpath "//h5[contains(text(),'Settings')]"
    Then I wait for element with xpath "//h4[contains(text(),'Settings')]" to be present
    When I click on element with xpath "//h5[contains(text(), 'My Assignments')]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'My Assignments')]" to be present
    When I click on element with xpath "(//span[contains(text(),'Go To Assessment')])[1]"
    And I wait for 1 sec
    Then I wait for element with xpath "//h4[contains(text(),'BatAl1')]" to be present
    Given element with xpath "(//div//mat-card[1]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[1]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[2]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[2]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]/..//div"
    Given element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[3]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[4]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[4]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[5]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[5]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[1]/..//div"
    Given element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[6]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[7]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[7]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[1]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[2]/..//div"
    Given element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[8]//ac-quiz-multiple-choice-question//div//mat-checkbox//label//span[@class='mat-checkbox-label'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[9]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[9]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[3]/..//div"
    And I wait for 1 sec
    Given element with xpath "(//div//mat-card[10]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]" should contain text "Right Answer"
    Then I click on element with xpath "(//div//mat-card[10]//ac-quiz-single-choice-question//div//mat-radio-group//mat-radio-button//label//div[@class='mat-radio-label-content'])[2]/..//div"
    And I wait for 1 sec
    When I click on element with xpath "//span[contains(text(),'Submit My Answers')]"
    Then I wait for element with xpath "//h1[contains(text(),'Success!')]" to be present
    And I wait for 1 sec
    Then I click on element with xpath "//span[contains(text(),'Ok')]"
    Then I wait for element with xpath "//h4[contains(text(),'My Assignments')]" to be present
    Then I click on element with xpath "//h5[contains(text(), 'My Grades')]"
    Then I wait for element with xpath "//h4[contains(text(), 'My Grades')]" to be present
    And I wait for 1 sec
    Given element with xpath "(//div//table//tbody//tr[@class='ng-star-inserted'])[last()]" should contain text "FAILED"












