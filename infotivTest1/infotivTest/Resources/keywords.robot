*** Keywords ***
Begin Web Test
    Open browser                           about:blank   ${BROWSER}
    Maximize Browser Window
    Load Page
    Verify Page Loaded

Load Page
    Go to                                  ${URL}
Verify Page Loaded
    Wait Until Page Contains        Infotiv Car Rental



Given that user is on Car selection page
  Load Page
  Verify Page Loaded

Given That user is logged in
    Input Text                  id:email     sami.kheelifi@gmail.com
    Input Password              id:password  qweasd12
    Click Button                id:login

When a user books a car
        Input Text                           id:start  04-03
        Input Text                           id:end  04-04
        Click Button                         id:continue
        Wait until page Contains             What would you like to drive?
        Wait until page Contains Element     id:bookQ7pass5
        Click Element                        id:bookQ7pass5
        Wait until page Contains             Confirm booking


        Input Text                           id:cardNum  8373958592859285
        Input Text                           id:fullName  Sami Khelifi
        Click Element                        class:mediumInputFields
        Select From List By Label            class:mediumInputFields  6
        Select From List By Label            xpath://*[@id="confirmSelection"]/form/select[2]  2019
        Input Text                           id=cvc  837

        Click Button                         id=confirm
        Wait Until Page Contains             is now ready for pickup

User clicks on Home button
    Click Button                              id=home

User should see the home page
    Wait Until Page Contains    When do you want to make your trip?

Then a car should be booked for the user
    Click Button                            id=mypage
    Wait Until Page Contains                My bookings
    Table Should Contain                    class:orderTable        Audi
    Table Should Contain                    class:orderTable        Q7
    Table Should Contain                    class:orderTable        2021-04-03
    Table Should Contain                    class:orderTable        2021-04-04
    Click Button                            id:unBook1
    Alert Should Be Present
    Wait Until Page Contains                has been Returned
    Click button                            id:mypage
    Wait Until Page Contains                You have no bookings







End Web Test
   Close Browser