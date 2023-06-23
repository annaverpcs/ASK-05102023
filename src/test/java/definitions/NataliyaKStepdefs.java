package definitions;

import cucumber.api.java.en.Then;
import support.Helper;

import java.io.IOException;
import java.sql.SQLException;



public class NataliyaKStepdefs {
    int iUserID;
    String sActivationCode;

    @Then("NK retrieve information from db for email {string}")
    public void nkRetrieveInformationFromDbForEmail(String sEmailAddress) throws SQLException {
        String sAccessToken = Helper.getAccessToken(sEmailAddress);
        String[] sData = sAccessToken.split(";");
        iUserID = Integer.parseInt(sData[0]);
        sActivationCode = sData[1];

        System.out.println("sAccessToken " + sAccessToken);
        System.out.println("iUserID " + iUserID);
        System.out.println("sActivationCode " + sActivationCode);
    }

    @Then("NK activate the user")
    public void nkActivateTheUser() throws IOException {
        Helper.activateUser(iUserID,sActivationCode);
    }
}
