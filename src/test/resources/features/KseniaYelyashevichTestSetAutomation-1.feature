# set of automated tests based on ASK051023-529 for “Single-Choice Question - Show-stopper” feature

# test case: ASK051023-530
  Feature: Single-Choice Question - Show-stopper"
    Scenario: Log in as Teacher, create quiz with a "Single-Choice Question - Show-Stopper"
      Given KY open url "ASK title page"
      When KY type "vicktoriamakarova@whatthefish.info" into field "Email *"
      And KY type "Password8!" into field "Password *"
      And KY click on button "Sign In"
      And I wait for 3 sec

      Then element with xpath "//div[@class='info']/p" should contain text "TEACHER"
      And element "Quizzes left menu option" should be displayed

      Then KY select option "Quizzes" in the left menu
      And I wait for 3 sec

      When KY click on button "Create New Quiz"
      And I wait for 2 sec
      And KY type "New Quiz - testing single-choice question - show-stopper" into field "Title Of The Quiz *"

      And KY click on button "Add Question"
      And KY select question number 1 for setup
      And I wait for 2 sec
      And KY set question type as "Single-Choice"
      And KY set question price as 7
      And I wait for 2 sec
      And KY set question title as "First question"
      And KY set option 1 as "Incorrect answer"
      And KY set option 2 as "Incorrect Answer"
      And KY add one more option in the question selected
      And I wait for 1 sec
      And KY set option 3 as "Correct Answer"
      And KY add one more option in the question selected
      And I wait for 1 sec
      And KY set option 4 as "Incorrect Answer"
      And KY set option 3 as correct answer
      And I wait for 3 sec
      And KY set question as show-stopper


      And KY click on button "Add Question"
      And I wait for 5 sec
      And KY select question number 2 for setup
      And KY set question type as "Multiple-Choice"
      And KY set question price as 9
      And KY set question title as "Second question"
      And KY add one more option in the question selected
      And KY add one more option in the question selected
      And KY set option 1 as "Correct answer"
      And KY set option 2 as "Incorrect answer"
      And KY set option 3 as "Correct answer"
      And KY set option 4 as "Incorrect answer"
      And I wait for 3 sec
      And KY set option 1 as correct answer
      And KY set option 3 as correct answer
      And I wait for 3 sec
    
      And KY click on button "Add Question"
      And KY select question number 3 for setup
      And I wait for 2 sec
      And KY set question type as "Textual"
      And I wait for 2 sec
      And KY set question price as 4
      And KY set question title as "Third question"

      And KY click on button "Save Quiz"
      And I wait for 5 sec

      Then KY select quiz by title "New Quiz - testing single-choice question - show-stopper"
      And I wait for 3 sec

      When KY open preview window of the quiz
      Then element with xpath "//ac-quiz-preview/h3" should contain text "PREVIEW MODE"
      And element with xpath "//ac-quiz-preview//ac-take-quiz/h4" should contain text "New Quiz - testing single-choice question - show-stopper"

      And KY verify that question 1 is marked as Show-Stopper
      And KY verify only one question in quiz is marked as Show-Stopper
      And KY verify that type of question 1 is "Single-Choice"

      When KY close preview window of the quiz
      And KY delete quiz selected
      Then KY verify that quiz with title "New Quiz - testing single-choice question - show-stopper" is not listed 
