// helper-class with methods to create a new quiz
// created by: Ksenia Yelyashevich

// before using any method from this class 2 main methods should be called firstly:
// 1) kySelectQuestionToSetup - to select (and expand it, if needed) a specific question by it's number
// 2) kySetQuestionTypeAs - to setup a type of question selected (it should be either 'Single-Choice', 'Multiple-Choice' or 'Textual')

// other methods provided:
// 3) kySetQuestionPrice - to setup the price of question selected (should be in range 1-10)
// 4) kyAddOneMoreOption - to add one more option in the question selected
// 5) kySetQuestionTitle - to setup the title of the question selected
// 6) kySetOption - to setup option (specified by number and with the string provided) of the question selected
// 7) kySetOptionAsCorrectAnswer - to selected correct(s) answer in the question selected (one - for Single-Choice type, multiple - for Multiple-Choice)
// 8) kySetQuestionAsShowStopper - to select the question as Show-Stopper


package definitions;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import java.util.List;
import static support.TestContext.getDriver;
import org.openqa.selenium.Keys;
import static org.assertj.core.api.Assertions.assertThat;


public class KseniaYelyashevichQuestionsHelperClass {
    int questionNumForSetup;
    WebElement questionFormNeeded;
    String questionTypeSelected;

    @When("KY select question number {int} for setup")
    public void kySelectQuestionToSetup(int questionNum) throws InterruptedException {
        questionNumForSetup = questionNum;
        System.out.println("Question num: " + questionNumForSetup);

        //in case the question is not expanded yet (to start setup)
        List<WebElement> allQuestionsExpansionPanels =  getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllQuestionsExpansionPanels));
        String expansionValue = allQuestionsExpansionPanels.get(questionNum - 1).getAttribute("aria-expanded");
        if (expansionValue.equals("false")) {
            allQuestionsExpansionPanels.get(questionNum - 1).click();
            Thread.sleep(2000);
        }

        // then get all elements from the form with settings for the specific question
        List<WebElement> allQuestionForms = getDriver().findElements(By.xpath(KseniaYelyashevichXPathLibrary.sAllQuestionForms));
        System.out.println("Question Forms detected: " + allQuestionForms.size());
        questionFormNeeded = allQuestionForms.get(questionNum - 1);
        System.out.println("Question form: " + questionFormNeeded);
        // ? should I add some assertion
    }


    @When("KY set question type as {string}")
    public void kySetQuestionTypeAs(String questionType) {
        questionTypeSelected = questionType;

        List<WebElement> typesRadioButtons = questionFormNeeded.findElements(By.xpath(KseniaYelyashevichXPathLibrary.sTypesRadioButton));
        System.out.println("Type Radio Buttons detected: " + typesRadioButtons.size());
        switch (questionType) {
            case "Textual":
                typesRadioButtons.get(0).click();
                break;
            case "Single-Choice":
                typesRadioButtons.get(1).click();
                break;
            case "Multiple-Choice":
                typesRadioButtons.get(2).click();
                break;
            default:
                System.out.println("The type was not selected (check the type provided, it should be either 'Single-Choice', 'Multiple-Choice' or 'Textual')");
                // ? should I add some assertion
        }
    }


    @When("KY set question price as {int}") // could be only in range 1-10
    public void kySetQuestionPrice(int questionPrice){
        WebElement priceSlider = questionFormNeeded.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuestionPriceSlider));
        //as the slider is always at position 5 by default
        if (questionPrice > 5) {
            for (int i = 5; i < questionPrice; i++) {
                priceSlider.sendKeys(Keys.ARROW_RIGHT);
            }
        }
        if (questionPrice < 5) {
            for (int i = 5; i > questionPrice; i--) {
                priceSlider.sendKeys(Keys.ARROW_LEFT);
            }
        }
        if (questionPrice > 10 || questionPrice < 1) {
            System.out.println("The price of question provided is incorrect (should be in range 1-10, actual: " + questionPrice + ")");
            // ? should I add some assertion
        }
    }


    @When("KY add one more option in the question selected")
    public void kyAddOneMoreOption(){
        questionFormNeeded.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sAddOptionButton)).click();
        // ? should I add some assertion
    }


    @When("KY set question title as {string}")
    public void kySetQuestionTitle(String questionTitle){
        WebElement quizTitleField = questionFormNeeded.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuestionTitleInputField));
        quizTitleField.click();
        quizTitleField.sendKeys(questionTitle);
        // ? should I add some assertion
    }


    @When("KY set option {int} as {string}")
    public void kySetOption(int optionNum, String optionText){
        List<WebElement> allQuestionOptions = questionFormNeeded.findElements(By.xpath(KseniaYelyashevichXPathLibrary.sQuestionOptions));
        WebElement optionNeeded = allQuestionOptions.get(optionNum-1);
        optionNeeded.click();
        optionNeeded.sendKeys(optionText);
        // ? should I add some assertion
    }


    @When("KY set option {int} as correct answer")
    public void kySetOptionAsCorrectAnswer(int optionNum) {
        switch (questionTypeSelected){
            case "Single-Choice":
                List<WebElement> allOptionRadioButtons = questionFormNeeded.findElements(By.xpath(KseniaYelyashevichXPathLibrary.sQuestionOptionRadioButtons));
                System.out.println("Option Radio Buttons (to select correct answer) detected: " + allOptionRadioButtons.size());
                WebElement optionRadioButtonNeeded = allOptionRadioButtons.get(optionNum-1);
                optionRadioButtonNeeded.click();
                break;
            case "Multiple-Choice":
                List<WebElement> allOptionCheckboxes = questionFormNeeded.findElements(By.xpath(KseniaYelyashevichXPathLibrary.sQuestionOptionCheckboxes));
                System.out.println("Option Checkboxes (to select correct answer) detected: " + allOptionCheckboxes.size());
                WebElement optionCheckboxNeeded = allOptionCheckboxes.get(optionNum-1);
                optionCheckboxNeeded.click();
                break;
            default:
                System.out.println("Option was not set as a correct answer for the question (check the number of option provided;" +
                        "function works only for 'Single-Choice' and 'Multiple-Choice' types of questions, not for 'Textual'!");
                // ? should I add some assertion
        }
    }


    @When("KY set question as show-stopper")
    public void kySetQuestionAsShowStopper() {
        questionFormNeeded.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sShowStopperCheckbox)).click();
        // ? should I add some assertion
    }

    @Then("KY verify that question is checked as \"Show-Stopper\"")
    public void kyVerifyQuestionIsCheckedAsShowStopper(){
        WebElement showStopperCheckbox = questionFormNeeded.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sShowStopperCheckboxStatus));
        String isChecked = showStopperCheckbox.getAttribute("aria-checked");
        assertThat(isChecked).isEqualTo("true");
    }

    @Then("KY verify that question is not checked as \"Show-stopper\"")
    public void kyVerifyQuestionIsNotCheckedAsShowStopper(){
        WebElement showStopperCheckbox = questionFormNeeded.findElement(By.xpath(KseniaYelyashevichXPathLibrary.sShowStopperCheckboxStatus));
        String isChecked = showStopperCheckbox.getAttribute("aria-checked");
        assertThat(isChecked).isEqualTo("false");
    }

}

