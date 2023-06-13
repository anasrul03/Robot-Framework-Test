*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${balance_real}    //*[@class="dc-text balance-text__text--real"]
${acc_switcher}    //*[@class="dc-text dc-dropdown__display-text"]
${demo_button}    //div[@id="demo"]

*** Test Cases ***
Log in using your account
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1080
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Input Text    txtEmail    ******
    Input Text    txtPass    ******
    Click Button    login
1. Log in using your account
2. Check the current account lands on real account
    Wait Until Page Contains Element    ${balance_real}    10
3. Then switch to virtual account and verify virtual account is displayed
    Click Element    ${acc_switcher}
    Wait Until Element Is Visible    ${demo_button}    10
    Click Element    ${demo_button}
    Close Browser    