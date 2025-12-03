*** Settings ***
Library    Browser

*** Variables ***
${LOGIN_URL}    https://practicetestautomation.com/practice-test-login/
${VALID_USERNAME}    student
${VALID_PASSWORD}    Password123

*** Test Cases ***
Valid Login Should Succeed
    New Browser    chromium
    New Page    ${LOGIN_URL}
    Fill Text    id=username    ${VALID_USERNAME}
    Fill Text    id=password    ${VALID_PASSWORD}
    Click    id=submit
    Wait For Elements State    text=Logged In Successfully    visible
    Screenshot
    Close Browser

Invalid Password Should Show Error
    New Browser    chromium
    New Page    ${LOGIN_URL}
    Fill Text    id=username    ${VALID_USERNAME}
    Fill Text    id=password    wrongpassword
    Click    id=submit
    Wait For Elements State    text=Your password is invalid!    visible
    Screenshot
    Close Browser

Invalid Username Should Show Error
    New Browser    chromium
    New Page    ${LOGIN_URL}
    Fill Text    id=username    wronguser
    Fill Text    id=password    ${VALID_PASSWORD}
    Click    id=submit
    Wait For Elements State    text=Your username is invalid!    visible
    Screenshot
    Close Browser
