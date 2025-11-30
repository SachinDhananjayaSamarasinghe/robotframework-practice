*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get All Posts Returns 200
    Create Session    jsonplaceholder    ${BASE_URL}    verify=${True}
    ${response}=    GET On Session    jsonplaceholder    /posts
    Should Be Equal As Integers    ${response.status_code}    200
    Log To Console    Got ${response.status_code} for /posts

Get Single Existing Post
    Create Session    jsonplaceholder    ${BASE_URL}    verify=${True}
    ${response}=    GET On Session    jsonplaceholder    /posts/1
    Should Be Equal As Integers    ${response.status_code}    200
    Should Contain    ${response.text}    userId
    Log To Console    Single post body: ${response.text}

Get Non-Existing Post Returns 404
    Create Session    jsonplaceholder    ${BASE_URL}    verify=${True}
    ${response}=    GET On Session    jsonplaceholder    /posts/999999
    Should Be Equal As Integers    ${response.status_code}    404
    Log To Console    Got ${response.status_code} for non-existing post
