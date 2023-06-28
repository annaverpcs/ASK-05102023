// helper-class with methods to select specific quiz (created before) and verify its content
// created by: Ksenia Yelyashevich

// before using any method from this class:
// 1) the Quizzes page should be opened
// 2) method 'kySelectQuizByTitle' should be run - to select (and expand) specific quiz (found by the title provided)

// other methods in the class:
// 3) kyQuizNumOfQuestionsIsEqual - to check the number of questions shown for a specific quiz (in the list of all quizzes)
// 4) kyOpenPreviewOfTheQuiz - to open preview of the quiz selected before (using "Preview" button)
// 5) kyClosePreviewOfTheQuiz
// 6) kyVerifyQuestionIsShowStopper - to verify that specific question in the quiz (that was opened in a preview mode) is marked as "show-stopper"
// 7) kyOnlyOneQuestionWithShowStopperIsShown - to check that only one question in the quiz is marked as "show-stopper"
// 8) kyNoQuestionWithShowStopperIsShown - to check that no question in the quiz selected is marked as "show-stopper"
// 9) kyVerifyThatTypeOfQuestionIs - to verify that the type of specific question (selected by number provided) is either 'Single-Choice', 'Multiple-Choice' or 'Textual'
// 10) kyDeleteQuizSelected - to delete quiz already selected before

// before using these methods just the Quizzes page should be opened:
// 11) kyQuizWithTitleIsListed - to check that some quiz with a specific title is present in the list of all quizzes
// 12) kyQuizWithTitleIsNotListed


package definitions;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import java.util.List;
import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;



public class KseniaYelyashevichQuizzesHelperClass {
    WebElement quizNeededFound; // this element contains everything that belongs to a specific quiz:
    // its title, number of questions inside and (if expanded) - more detailed info + "Preview", "Edit" and "Delete" buttons

    @When("KY select quiz by title {string}")
    public void kySelectQuizByTitle(String quizTitleToFind) throws InterruptedException {
        List<WebElement> allQuizzes = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllQuizzesInfo));

        Thread.sleep(5000);
        for (WebElement currQuiz : allQuizzes) {
            WebElement currQuizTitleElement = currQuiz.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizTitleText));
            String currQuizTitleText = currQuizTitleElement.getText();

            if (currQuizTitleText.equals(quizTitleToFind)) {
                quizNeededFound = currQuiz;
                currQuiz.click();
                Thread.sleep(2000);
                break;
                // ? should I add some assertion
            }
        }
    }

    @Then("KY verify that number of questions in the quiz is equal to {int}")
    public void kyQuizNumOfQuestionsIsEqual(int numQuestionsExpected) {
        String quizDescription = quizNeededFound.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizDescription)).getText();
        String[] textInDescription = quizDescription.split("");
        int numberShown = Integer.parseInt(textInDescription[0]);
        assertThat(numberShown).isEqualTo(numQuestionsExpected);
    }


    @When("KY open preview window of the quiz")
    public void kyOpenPreviewOfTheQuiz() {
        WebElement previewButton = quizNeededFound.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizPreviewButton));
        previewButton.click();
        // ? should I add some assertion
    }


    @When("KY close preview window of the quiz")
    public void kyClosePreviewOfTheQuiz() {
        WebElement closeButton = getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sCloseQuizPreviewWindowButton));
        closeButton.click();
        // ? should I add some assertion
    }


    @Then("KY verify that question {int} is marked as Show-Stopper")
    public void kyVerifyQuestionIsShowStopper(int questionNum) throws InterruptedException {
        List<WebElement> allQuestionCardsShown = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllQuestionsCards));
        Thread.sleep(2000);
        WebElement questionNeeded = allQuestionCardsShown.get(questionNum - 1);
        assertThat(questionNeeded.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sShowStopperMarkInQuestion)).isDisplayed()).isTrue();
    }


    @Then("KY verify only one question in quiz is marked as Show-Stopper")
    public void kyOnlyOneQuestionWithShowStopperIsShown() throws InterruptedException {
        List<WebElement> allShowStoppersShown = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllShowStoppersShownInQuizPreview));
        assertThat(allShowStoppersShown.size()).isEqualTo(1);
    }


    @Then("KY verify no question in quiz is marked as Show-Stopper")
    public void kyNoQuestionWithShowStopperIsShown() throws InterruptedException {
        List<WebElement> allShowStoppersShown = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllShowStoppersShownInQuizPreview));
        assertThat(allShowStoppersShown.size()).isEqualTo(0);
    }


    @Then("KY verify that type of question {int} is {string}")
    public void kyVerifyThatTypeOfQuestionIs(int questionNum, String questionType) {
        List<WebElement> allQuestionsInQuiz = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllQuestionsCards));
        WebElement questionNeeded = allQuestionsInQuiz.get(questionNum - 1);

        List<WebElement> singleChoiceTag = questionNeeded.findElements(By.xpath(KseniaYelyashevichXPathLibrary.sSingleChoiceQuestionTag));
        List<WebElement> multipleChoiceTag = questionNeeded.findElements(By.xpath(KseniaYelyashevichXPathLibrary.sMultipleChoiceQuestionTag));
        List<WebElement> textualTag = questionNeeded.findElements(By.xpath(KseniaYelyashevichXPathLibrary.sTextualQuestionTag));

        List<WebElement> radioButtonsFound = questionNeeded.findElements(By.xpath(".//input[@type='radio']"));
        List<WebElement> checkboxesFound = questionNeeded.findElements(By.xpath(".//input[@type='checkbox']"));
        List<WebElement> textAreasFound = questionNeeded.findElements(By.xpath(".//textarea"));

        switch (questionType) {
            case "Single-Choice":
                assertThat(singleChoiceTag.size()).isEqualTo(1);
                assertThat(radioButtonsFound.size()).isNotEqualTo(0);
                assertThat(checkboxesFound.size()).isEqualTo(0);
                assertThat(textAreasFound.size()).isEqualTo(0);
                break;

            case "Multiple-Choice":
                assertThat(multipleChoiceTag.size()).isEqualTo(1);
                assertThat(radioButtonsFound.size()).isEqualTo(0);
                assertThat(checkboxesFound.size()).isNotEqualTo(0);
                assertThat(textAreasFound.size()).isEqualTo(0);
                break;

            case "Textual":
                assertThat(textualTag.size()).isEqualTo(1);
                assertThat(radioButtonsFound.size()).isEqualTo(0);
                assertThat(checkboxesFound.size()).isEqualTo(0);
                assertThat(textAreasFound.size()).isNotEqualTo(0);
                break;

            default:
                System.out.print("Incorrect type of question was provided to compare with (should be either 'Single-Choice', 'Multiple-Choice', 'Textual'");
                // ? should I add some assertion
                break;
        }
    }


    // the method deletes quiz that was already selected (and so expanded)
    @When("KY delete quiz selected")
    public void kyDeleteQuizSelected() throws InterruptedException {
        WebElement deleteButton = quizNeededFound.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizDeleteButton));
        deleteButton.click();
        Thread.sleep(2000);
        WebElement confirmDeleteButton = getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizDeleteConfirmButton));
        confirmDeleteButton.click();
        // ? should I add some assertion
    }

    //to use this method Quizzes page itself should be opened
    @Then("KY verify that quiz with title {string} is listed")
    public void kyQuizWithTitleIsListed(String quizTitleToFind) throws InterruptedException {
        List<WebElement> allQuizzes = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllQuizzesInfo));
        Thread.sleep(5000);
        int isListed = 0;
        for (WebElement currQuiz : allQuizzes) {
            String currQuizTitleText = currQuiz.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizTitleText)).getText();
            if (currQuizTitleText.equals(quizTitleToFind)) {
                isListed++;
            }
        }
        assertThat(isListed).isGreaterThan(0);
    }


    //the Quizzes page should be opened to use this method
    @Then("KY verify that quiz with title {string} is not listed")
    public void kyQuizWithTitleIsNotListed(String quizTitleToFind) throws InterruptedException {
        //Thread.sleep(5000);
        List<WebElement> allQuizzes = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllQuizzesInfo));
        int isListed = 0;
        for (WebElement currQuiz : allQuizzes) {
            WebElement quizTitleElement = currQuiz.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizTitleText));
            String currQuizTitleText = quizTitleElement.getText();
            if (currQuizTitleText.equals(quizTitleToFind)) {
                isListed++;
            }
        }
        assertThat(isListed).isEqualTo(0);
    }

    @When ("KY start to edit quiz")
    public void kyEditQuizSelected() throws InterruptedException {
        WebElement editButton = quizNeededFound.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizEditButton));
        editButton.click();
        Thread.sleep(2000);
        // ? should I add some assertion
    }

}