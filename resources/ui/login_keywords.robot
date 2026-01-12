*** Settings ***
Library     Browser
Resource    ./pages/login_page.robot

*** Keywords ***
Open Login Page
    New Browser    chromium    headless=${False}
    New Context
    New Page       ${LOGIN_URL}
    Wait For Load State    load    timeout=20000

Login With Credentials
    [Arguments]    ${username}    ${password}
    Fill Text      ${USERNAME_INPUT}    ${username}
    Fill Text      ${PASSWORD_INPUT}    ${password}
    Click          ${SUBMIT_BUTTON}

Login Should Be Successful
    Wait For Elements State    ${SUCCESS_TEXT}    visible

Login Should Fail
    Wait For Elements State    ${ERROR_MESSAGE}   visible

Close Browser Session Safely
    Run Keyword And Ignore Error    Take Screenshot
    Run Keyword And Ignore Error    Close Browser
