*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Get Posts From Public API
    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com
    ${response}=    GET On Session    jsonplaceholder    /posts
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    API returned status: ${response.status_code}
