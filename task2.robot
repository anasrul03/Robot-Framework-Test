*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${acc_switcher}    //*[@class="dc-text dc-dropdown__display-text"]
${demo_button}    //div[@id="demo"]
${deriv_trade}    //*[@class="dc-btn dc-btn--primary"]
${trade_type}    //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
${ticks}    //*[@id="dt_duration_range_input"]
${tick5}    //*[@data-testid="tick_step_5"]

*** Test Cases ***
Log in using your account
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1080
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Input Text    txtEmail    ****@besquare.com.my
    Input Text    txtPass    ********
    Click Button    login
Switch to demo account
    Click Element    ${acc_switcher}
    Wait Until Element Is Visible    ${demo_button}    10
    Click Element    ${demo_button}
Underlying : Volatilty 10(1s) Index
    Wait Until Page Contains Element    ${deriv_trade}    10
    Click Element    ${deriv_trade}
Selecting trade types Rise/Falls
    Wait Until Page Contains Element   ${trade_type}    10
    Click Element    ${trade_type} 
Selecting Ticks
    Wait Until Element Is Visible    dc_t_toggle_item    10
    Click Element    dc_t_toggle_item
# Input ticks range
#     IF    ${ticks} != 5
#     Click Element    ${tick5} 
#     END
    
    