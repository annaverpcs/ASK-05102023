package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import support.Helper;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static support.TestContext.getDriver;


public class KseniaYelyashevichStepDefs {

    int iUserId;
    String sActivationCode;

    @When("KY retrieve info from DB for email {string}")
    public void kyRetrieveInfoFromDbForEmail(String sEmailAddress) throws SQLException {
        System.out.print("Email: " + sEmailAddress + "\n");
        String sAccessToken = Helper.getAccessToken(sEmailAddress);
        // all data from response in array
        System.out.print("Data: " + sAccessToken + "\n\n");
        String[] sData = sAccessToken.split(";");
        System.out.println(sAccessToken);
        iUserId = Integer.parseInt(sData[0]);
        sActivationCode = sData[1];

        assertThat(sAccessToken).isNotEmpty();
        // ? should I add some more assertions
    }


    @When("KY activate user")
    public void kyActivateUser() throws IOException {
        Helper.activateUser(iUserId, sActivationCode);

    }


    @Given("KY open url {string}")
    public void kyOpenUrl(String sUrl) {
        switch (sUrl) {
            case "ASK title page":
                getDriver().get(KseniaYelyashevichXPathLibrary.sStartPageURL);
                break;
            case "ASK registration page":
                getDriver().get(KseniaYelyashevichXPathLibrary.sRegistrationPage);
                break;
            default:
                System.out.println("The name of the page provided is not detected to be opened (could be either 'ASK title page' or 'ASK registration page'");
        }
    }

    @And("KY click on button {string}")
    public void kyClickOnButton(String sXpath) {
        switch (sXpath){
            case "Register Now":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sRegisterNowButton)).click();
                break;
            case "Register Me":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sRegisterMeButton)).click();
                break;
            case "Sign In":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sSignInButtonLoginPage)).click();
                break;
            case "Create New Quiz":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sCreateNewQuizButton)).click();
                break;
            case "Add Question":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sAddQuestionButton)).click();
                break;
            case "Save Quiz": // to save the quiz created
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sSaveQuizButton)).click();
                break;
            default:
                System.out.println("Name of the button provided is not detected, it should be either \"Register Now\", \"Register Me\", \"Sign In\", \"Create New Quiz\", \"Add Question\", \"Save Quiz\"");
        }

    }


    @When("KY type {string} into field {string}")
    public void kyTypeIntoField(String sWhatToType, String sInWhatField) {
        switch (sInWhatField){
            case "First Name":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sFirstNameInputField)).sendKeys(sWhatToType);
                break;
            case "Last Name":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sLastNameInputField)).sendKeys(sWhatToType);
                break;
            case "Email":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sEmailInputField)).sendKeys(sWhatToType);
                break;
            case "Group Code":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sGroupCodeInputField)).sendKeys(sWhatToType);
                break;
            case "Password":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sPasswordInputField)).sendKeys(sWhatToType);
                break;
            case "Confirm Password":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sConfirmPasswordInputField)).sendKeys(sWhatToType);
                break;
            case "Email *":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sEmailInputFieldLoginPage)).sendKeys(sWhatToType);
                break;
            case "Password *":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sPasswordInputFieldLoginPage)).sendKeys(sWhatToType);
                break;
            case "Title Of The Quiz *":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sTitleOfQuizInputField)).sendKeys(sWhatToType);
                break;

        }
    }

    @Then("element {string} should be displayed")
    public void elementShouldBeDisplayed(String sElementName) {
        switch (sElementName) {
            case "Register Me button":
                assertThat(getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sRegisterMeButton)).isDisplayed()).isTrue();
                break;
            case "Registration title":
                assertThat(getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sRegistrationTitleRegistrationPage)).isDisplayed()).isTrue();
                break;
            case "You have been Registered title":
                assertThat(getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sYouHaveBeenRegisteredTitleRegistrationPage)).isDisplayed()).isTrue();
                break;
            case "Back to Login page button":
                assertThat(getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sBackToLoginPageButton)).isDisplayed()).isTrue();
                break;
            case "My Grades left menu option":
                assertThat(getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sMyGradesLeftMenuOption)).isDisplayed()).isTrue();
                break;
            case "Quizzes left menu option":
                assertThat(getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizzesLeftMenuOption)).isDisplayed()).isTrue();
                break;

        }
    }


    @Then("KY select option {string} in the left menu")
    public void kySelectOptionInTheLeftMenu(String optionName) {
        switch(optionName) {
            case "Quizzes":
                getDriver().findElement(By.xpath(KseniaYelyashevichXPathLibrary.sQuizzesLeftMenuOption)).click();
                break;

        }
    }
}