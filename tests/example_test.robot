*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get Posts From Public API
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com    verify=true
    ${response}=    Get On Session    jsonplaceholder    /posts/1
    Log To Console    API returned status: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200
