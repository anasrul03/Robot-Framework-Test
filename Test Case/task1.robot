*** Settings ***
Documentation    Switch test real to virtual account
Library    SeleniumLibrary
Library    Process

*** Variables ***
${thub_btn}    //*[@class="dc-text trading-hub-header__tradershub--text"]
${real_acc}    //*[@id="dropdown-display"]//span[@value="real"]
${demo_acc}    //div[@id="demo"]
${balance_real}    //*[@class="dc-text balance-text__text--real"]
${balance_demo}    //*[@class="dc-text balance-text__text--demo"]

*** Test Cases ***
login
    Open Browser    https://app.deriv.com    chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Input Text    txtEmail    ******
    Input Password    txtPass    ******
    Click Element    login
    Wait Until Page Contains Element    ${thub_btn}    10
    Click Element    ${thub_btn}
    Wait Until Page Contains Element    ${real_acc}    10
    Wait Until Page Contains Element    ${balance_real}    10
    Click Element    ${real_acc}
    Wait Until Element Is Visible    ${demo_acc}    5
    Click Element    ${demo_acc}
    Wait Until Page Contains Element    ${balance_demo}

    
