package definitions;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import support.Helper;

import java.io.IOException;
import java.sql.SQLException;

import static support.TestContext.getDriver;

public class GeorgyYStepdefs {

    int iUserID;
    String sActivationCode;

    @Then("AV retrieve information from db for email {string}")
    public void avRetrieveInformationFromDbForEmail(String sEmailAddress) throws SQLException {
        String sAccessToken = Helper.getAccessToken(sEmailAddress);
        String[] sData = sAccessToken.split(";");
        iUserID = Integer.parseInt(sData[0]);
        sActivationCode = sData[1];

        System.out.println("sAccessToken " + sAccessToken);
        System.out.println("iUserID " + iUserID);
        System.out.println("sActivationCode " + sActivationCode);
    }

    @Then("AV retrieve information from db for email <sEmailAddress>")
    public void avRetrieveInformationFromDbForEmailSEmailAddress(String sEmailAddress) throws SQLException {
        String sAccessToken = Helper.getAccessToken(sEmailAddress);
        String[] sData = sAccessToken.split(";");
        iUserID = Integer.parseInt(sData[0]);
        sActivationCode = sData[1];

        System.out.println("sAccessToken " + sAccessToken);
        System.out.println("iUserID " + iUserID);
        System.out.println("sActivationCode " + sActivationCode);
    }



    @Then("AV activate the user")
    public void avActivateTheUser() throws IOException {
        Helper.activateUser(iUserID,sActivationCode);
    }

    @Given("AV open {string}")
    public void avOpen(String sURL) {
        getDriver().get(XpathLibrary.sRegistrationURL);
    }

    @And("AV type {string} into element with xpath {string}")
    public void avTypeIntoElementWithXpath(String sText, String sXpathLocation) {
        switch (sXpathLocation){
            case "FirstNameXpath": getDriver().findElement(By.xpath(XpathLibrary.sFirstNameXpath)).sendKeys(sText);
                break;
            case "LastNameXpath": getDriver().findElement(By.xpath(XpathLibrary.sLastNameXpath)).sendKeys(sText);
                break;
            case "EmailXpath": getDriver().findElement(By.xpath(XpathLibrary.sEmailXpath)).sendKeys(sText);
                break;
            case "GroupXpath":getDriver().findElement(By.xpath(XpathLibrary.sGroupIDXpath)).sendKeys(sText);
                break;
            case "PasswordXpath":getDriver().findElement(By.xpath(XpathLibrary.sPasswordXpath)).sendKeys(sText);
                break;
            case "ConfirmPasswordXpath":getDriver().findElement(By.xpath(XpathLibrary.sConfirmPasswordXpath)).sendKeys(sText);
                break;
        }

    }

    @Then("AV click on button {string}")
    public void avClickOnButton(String sButton) {
        getDriver().findElement(By.xpath(XpathLibrary.sRegisterMeButtonXpath)).click();
    }



}

