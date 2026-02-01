*** Settings ***
Library     Browser
Resource    browser_config.robot
Resource    ./pages/login_page.robot

*** Keywords ***
Open Login Page
    New Browser    ${BROWSER}    headless=${HEADLESS}    slowMo=${SLOW_MO}    args=["--disable-dev-shm-usage"]
    New Context
    New Page    ${LOGIN_URL}    waitUntil=domcontentloaded
    Wait For Elements State    id=username    visible    timeout=15s

Login With Credentials
    [Arguments]    ${username}    ${password}
    Fill Text      id=username    ${username}
    Fill Text      id=password    ${password}
    Click          id=submit

Login Should Be Successful
    Wait For Elements State    text=Logged In Successfully    visible
    Take Screenshot

Login Should Fail
    Wait For Elements State    id=error    visible
    Take Screenshot

Close Browser Session
    Run Keyword And Ignore Error    Take Screenshot
    Run Keyword And Ignore Error    Close Browser
