*** Settings ***
Library    SeleniumLibrary
Library    Process


*** Variables ***
${profile_icon}    //*[@class="trading-hub-header__setting"]
${account_closing}    //*[@id="/account/closing-account"]

#button
${cancel}    //*[@type="submit"]
${back}    //*[@class="dc-btn dc-btn__effect dc-btn--secondary dc-btn__large"]
${security-policy}    //*[@class="link"]
${close_my_account}    //*[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
${checkbox1}    //*[@class="closing-account-reasons"]/form/label[1]
${checkbox2}    //*[@class="closing-account-reasons"]/form/label[2]
${checkbox3}    //*[@class="closing-account-reasons"]/form/label[3]
${checkbox4}    //*[@class="closing-account-reasons"]/form/label[4]/input
${suggestion_box1}    //*[@class="dc-input__field dc-input__textarea dc-input__field--placeholder-visible"]
${suggestion_box2}    //*[@class="dc-input__field dc-input__textarea dc-input__field--placeholder-visible"]
${continue_button}    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"]
${back_close}    //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]/button[1]
${continue_close}    //*[@class="dc-form-submit-button account-closure-warning-modal__close-account-button dc-form-submit-button--relative"]/button[2]
${reactive_acc}    //*[@id="btnGrant"]
${title}    //*[@class="heading heading-medium typography typography-weight-normal typography-break-word typography-color-primary"]
${error_display}    //*[@class="dc-text closing-account-reasons__error"]
*** Keywords ***
Log in to deriv
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1080
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Input Text    txtEmail    hanasrullah@besquare.com.my
    Input Text    txtPass    L0ngk4ng_469227
    Click Button    login

Go to Close account page
    Wait Until Page Contains Element    ${profile_icon}    10
    Click Element    ${profile_icon}
    Wait Until Page Contains Element   ${account_closing}     10
    Click Element    ${account_closing} 

Close an account
    Wait Until Element Is Enabled    ${continue_button}    10
    Click Element    ${continue_button}
    Wait Until Element Is Visible    ${continue_close}    10
    Click Element    ${continue_close}

*** Test Cases ***

TC01: Login Deriv API
    Log in to deriv
    Close Browser

TC02: Accessing Closing account page
    Log in to deriv
    Go to Close account page
    Close Browser

TC03: Cancel account closing 
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${cancel}    10
    Click Element    ${cancel} 
    Close Browser

TC04: Go back after proceed to close page
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${back}    10
    Click Element    ${back}
    Wait Until Page Contains Element    //*[@class="dc-text closing-account__information--bold"]


TC05: Security and privacy policy
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${security-policy}    10
    Click Element    ${security-policy}
    Switch Window    url=https://deriv.com/tnc/security-and-privacy.pdf
    Close Browser

TC06: Closing an account with one reason 
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox1}    10
    Click Element    ${checkbox1}
    Close an account
    Wait Until Page Contains Element    //*[@class="dc-text account-closed"]    10
    Close Browser

TC07: Closing an account with two reason 
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox1}    10
    Click Element    ${checkbox1}
    Wait Until Page Contains Element    ${checkbox2}    10
    Click Element    ${checkbox2}
    Close an account
    Close Browser
TC08: Closing an account with three reason 
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox1}    10
    Click Element    ${checkbox1}
    Wait Until Page Contains Element    ${checkbox2}    10
    Click Element    ${checkbox2}
    Wait Until Page Contains Element    ${checkbox3}    10
    Click Element    ${checkbox3}
    Close an account
    Close Browser
TC09: Checkbox disabled after 3 reason selected
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox1}    10
    Click Element    ${checkbox1}
    Wait Until Page Contains Element    ${checkbox2}    10
    Click Element    ${checkbox2}
    Wait Until Page Contains Element    ${checkbox3}    10
    Click Element    ${checkbox3}
    Element Should Be Disabled    ${checkbox4} 
    Close an account
    Close Browser
TC10: Leave a suggestion blank
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox4}    10
    Click Element    ${checkbox4}
    Close an account
    Close Browser

TC11: Leave a suggestion more than 110 characters
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox4}    10
    Click Element    ${checkbox4}
    Input Text    ${suggestion_box1}    kjaewfbekajfbkjeabfkjabkjfbeakjfbjeakbfkjeabfjkbeakjfbeakjfbjeabkfeabfkjbeakjbfjabjkfebakjfbajebfjeabkjfeabkjfbkjeabfkjeabkjfbeakjbfekjabfkjeab
    Close an account
    Close Browser

TC12: Wrong Characters input in textbox
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox1}    10
    Click Element    ${checkbox1}
    Input Text    ${suggestion_box1}    !!
    Element Should Contain    ${error_display}    Must be numbers, letters, and special characters . , ' -

    

TC12: Leave a suggestion less than 110 characters
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox2}    10
    Click Element    ${checkbox2}
    Input Text    ${suggestion_box1}    kjaewfb
    Close an account   
   
TC13: Go back after continue close account
    Log in to deriv
    Go to Close account page
    Wait Until Page Contains Element    ${close_my_account}    10
    Click Element    ${close_my_account}
    Wait Until Page Contains Element    ${checkbox2}    10
    Click Element    ${checkbox2}
    Wait Until Element Is Enabled    ${continue_button}    10
    Click Element    ${continue_button}
    Wait Until Element Is Visible    ${back_close}    10
    Click Element    ${back_close}    
    Close Browser

TC14: Reactive account after close
    Log in to deriv
    Wait Until Page Contains Element    ${reactive_acc}    10
    Click Element    ${reactive_acc}
    Go to Close account page
    Close Browser
