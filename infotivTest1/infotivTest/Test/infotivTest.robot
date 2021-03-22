*** Settings ***
Documentation                Testar Selenium och RobotFramework
Resource                     ../Resources/keywords.robot
Library                      SeleniumLibrary
Test Setup                   Begin Web Test
Test Teardown                End Web Test

*** Variables ***
${BROWSER}      headless chrome
${URL}          https://www.rental2.infotiv.net


*** Test Cases ***


Access website
    [Documentation]             Test for accessing website infotiv
    [Tags]                      Access_test
    #Test website connection
    Wait Until Page Contains    Infotiv Car Rental

# _______________________________________________________________________


Test login function with valid credentials
    [Documentation]             test login with valid credentials
    [Tags]                      testValidLogin
    #Input login credentials
    Input Text                  id:email     sami.kheelifi@gmail.com
    Input Password              id:password  qweasd12
    #Login
    Click Button                id:login
    #Verify login
    Wait Until Page Contains    You are signed in as sami

# _______________________________________________________________________

Test login function with invalid credentials
    [Documentation]             test login with invalid credentials
    [Tags]                      testInvalidLogin
    #Input login credentials
    Input Text                  id:email     fel@gmail.com
    Input Password              id:password  felfel
    #Login
    Click Button                id:login
    #Verify login
    Element Should Be Visible     id:signInError

# _______________________________________________________________________

Test login function invalid email and valid password

    [Documentation]             test login with invalid email and vaild password
    [Tags]                      testInvalidValid
    #Input login credentials
    Input Text                  id:email     fel@gmail.com
    Input Password              id:password  qweasd12
    #Login
    Click Button                id:login
    #Verify login
    Element Should Be Visible     id:signInError
# _______________________________________________________________________


Test login function valid email and invalid password

    [Documentation]             test login with valid email and invaild password
    [Tags]                      testValidInvalid
    #Input login credentials
    Input Text                  id:email     sami.kheelifi@gmail.com
    Input Password              id:password  felfel
    #Login
    Click Button                id:login
    #Verify login
    Element Should Be Visible     id:signInError

# _______________________________________________________________________
Test to logout after logging in
    [Documentation]                 Test the logout function
    [Tags]                          LogOutTest
     #Input login credentials
    Input Text                          id:email     sami.kheelifi@gmail.com
    Input Password                      id:password  qweasd12
    #Login
    Click Button                        id:login
    #Verify login
    Wait Until Page Contains            You are signed in as sami
    Click Button                        id:logout
    Wait Until Page Contains            Login

# _______________________________________________________________________

Test invalid date in date section

    [Documentation]                     test invalid date in date section
    [Tags]                              testInvalidDate
    #Input invalid dates
    Input Text                           id:start  01-07
    #Confirm date
    Click Button                         id:continue
    Element Should Be Visible           css:#start:invalid
# _______________________________________________________________________

Test valid date in date section

    [Documentation]                     test valid date in date section
    [Tags]                              testValidDate
    #Input invalid dates
    Input Text                           id:start  04-03
    Input Text                           id:end    04-04
    Click Button                         id:continue
    Wait Until Page Contains             What would you like to drive?
# _______________________________________________________________________

Test book a car
    [Documentation]             Test the whole booking system
    [Tags]                      VG_test

    Given that user is on Car selection page
    Given That user is logged in
    When a user books a car
    Then a car should be booked for the user