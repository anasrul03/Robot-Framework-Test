*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${profile_icon}    //*[@class="trading-hub-header__setting"]
${api_token_tile}    //div[@id="/account/api-token"]
#CRUD token
${input_token_name}    //*[@class="dc-input__field"]
${create_button}    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${delete_token_icon}    //*[@class="dc-icon dc-clipboard da-api-token__delete-icon"]
${confirm_delete}    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]

#Checkboxes
${read}    //*[@class="da-api-token__checkbox-wrapper"]/div[1]
${trade}    //*[@class="da-api-token__checkbox-wrapper"]/div[2]
${payments}    //*[@class="da-api-token__checkbox-wrapper"]/div[3]
${trading_information}    //*[@class="da-api-token__checkbox-wrapper"]/div[4]
${admin}    //*[@class="da-api-token__checkbox-wrapper"]/div[5]

*** Keywords ***
Log in to deriv
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1080
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Input Text    txtEmail    ****@besquare.com.my
    Input Text    txtPass    ********
    Click Button    login

Go to API token page
    Wait Until Page Contains Element    ${profile_icon}    10
    Click Element    ${profile_icon}
    Wait Until Page Contains Element   ${api_token_tile}    10
    Click Element    ${api_token_tile}

Checked Read scope
    Wait Until Page Contains Element    ${read}    10
    Click Element    ${read}
Checked Trade scope
    Wait Until Page Contains Element    ${trade}    10
    Click Element    ${trade}
Checked Payments scope
    Wait Until Page Contains Element    ${payments}    10
    Click Element    ${payments}
Checked Trading Information scope
    Wait Until Page Contains Element    ${trading_information}    10
    Click Element    ${trading_information}
Checked Admin scope
    Wait Until Page Contains Element    ${admin}    10
    Click Element    ${admin}

Input Token Name and create
    Input Text    ${input_token_name}    Token Name
    Wait Until Element Is Enabled    ${create_button}
    Click Element    ${create_button}

Delete Token 
    Wait Until Page Contains Element    ${delete_token_icon}    10
    Click Element    ${delete_token_icon}
    Wait Until Element Is Visible    ${confirm_delete}
    Click Element    ${confirm_delete}


*** Test Cases ***
TC01: Login Deriv API
    Log in to deriv

TC02: Accessing API Token page
    # Log in to deriv
    Go to API token page

TC03: Checkbox Read
    # Log in to deriv
    # Go to API token page
    Checked Read scope
    Input Token Name and create
    Delete Token

TC04: Checkbox Trade
    # Log in to deriv
    # Go to API token page
    Checked Trade scope
    Input Token Name and create
    Delete Token

TC05: Checkbox Payments
    # Log in to deriv
    # Go to API token page
    Checked Payments scope
    Input Token Name and create
    Delete Token

TC06: Checkbox Trading Information
    # Log in to deriv
    # Go to API token page
    Checked Trading Information scope
    Input Token Name and create
    Delete Token

TC07: Checkbox Admin
    # Log in to deriv
    # Go to API token page
    Checked Admin scope
    Input Token Name and create
    Delete Token

TC08: Display token list and information
    # Log in to deriv
    # Go to API token page
    Checked Trade scope
    Input Token Name and create
    

TC09: Delete token
    # Log in to deriv
    # Go to API token page
    Checked Read scope
    Checked Trade scope
    Checked Payments scope
    Checked Trading Information scope
    Checked Admin scope
    Input Token Name and create
    Delete Token
TC10: Copy paste token into application

TC11: Show token key

TC12: Hide token key


