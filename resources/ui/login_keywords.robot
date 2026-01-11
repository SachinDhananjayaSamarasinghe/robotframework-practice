*** Settings ***
Library     Browser
Variables   pages/login_page.robot

*** Keywords ***
Open Login Page
    New Browser    chromium
    New Page       ${LOGIN_URL}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Fill Text      ${USERNAME_INPUT}    ${username}
    Fill Text      ${PASSWORD_INPUT}    ${password}
    Click          ${SUBMIT_BUTTON}

Login Should Be Successful
    Wait For Elements State    ${SUCCESS_TEXT}    visible

Login Should Fail
    Wait For Elements State    ${ERROR_MESSAGE}   visible

Close Browser Session
    Take Screenshot
    Close Browser
