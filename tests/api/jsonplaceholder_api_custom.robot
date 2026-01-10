*** Settings ***
Library    libraries.qa_library.QALibrary
Test Tags    api    smoke

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get All Posts Should Return 200 (Custom Library)
    [Tags]    smoke
    ${response}=    Get Request    ${BASE_URL}/posts
    Validate Response Status Code    ${response}    200

Get Single Post And Validate Content (Custom Library)
    [Tags]    regression
    ${response}=    Get Request    ${BASE_URL}/posts/1
    Validate Response Status Code    ${response}    200

    ${json}=    Get Json Response    ${response}
    Should Be Equal As Integers    ${json}[id]    1
    Should Not Be Empty    ${json}[title]
