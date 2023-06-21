package definitions;

public class KseniaYelyashevichXPathLibrary {

    //URLs
    public static String sStartPageURL = "http://ask-int.portnov.com/";
    public static String sRegistrationPage = "http://ask-int.portnov.com/#/registration";

    //Login page
    public static String sRegisterNowButton = "//span[contains(text(), 'Register Now')]"; // to start registration
    public static String sEmailInputFieldLoginPage = "//input[@placeholder = 'Email *']";
    public static String sPasswordInputFieldLoginPage = "//input[@placeholder = 'Password *']";
    public static String sSignInButtonLoginPage = "//span[contains(text(), 'Sign In')]/ancestor::button";

    //Registration page
    public static String sFirstNameInputField = "//input[@placeholder = 'First Name']";
    public static String sLastNameInputField = "//input[@placeholder = 'Last Name']";
    public static String sEmailInputField = "//input[@placeholder = 'Email']";
    public static String sGroupCodeInputField = "//input[@placeholder = 'Group Code']";
    public static String sPasswordInputField = "//input[@placeholder = 'Password']";
    public static String sConfirmPasswordInputField = "//input[@placeholder = 'Confirm Password']";
    public static String sRegisterMeButton = "//span[contains(text(), 'Register Me')]"; //to submit registration form
    public static String sRegistrationTitleRegistrationPage = "//h4[contains(text(), 'Registration')]";
    public static String sYouHaveBeenRegisteredTitleRegistrationPage = "//h4[contains(text(), 'You have been Registered')]";
    public static String sBackToLoginPageButton = "//span[contains(text(), 'Back to Login Page')]/ancestor::button";


    //Left menu of the App
    public static String sMyGradesLeftMenuOption = "//h5[contains(text(), 'My Grades')]";


}
