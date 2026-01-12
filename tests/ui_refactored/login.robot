*** Settings ***
Resource    ../../resources/ui/login_keywords.robot
Test Teardown    Close Browser Session

*** Variables ***
${VALID_USERNAME}    student
${VALID_PASSWORD}    Password123

*** Test Cases ***
Valid Login Should Succeed
    [Tags]    ui
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Login Should Be Successful

Invalid Password Should Show Error
    [Tags]    ui    regression
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    wrongpassword
    Login Should Fail

Invalid Username Should Show Error
    [Tags]    ui    regression
    Open Login Page
    Login With Credentials    wronguser    ${VALID_PASSWORD}
    Login Should Fail
