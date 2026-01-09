*** Settings ***
Library    libraries.qa_library.QALibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Validate Multiple Post IDs
    [Template]    Validate Single Post Contract
    1
    2
    3
    10
    50

*** Keywords ***
Validate Single Post Contract
    [Arguments]    ${post_id}
    ${response}=    Get Request    ${BASE_URL}/posts/${post_id}
    Validate Status Code    ${response}    200

    ${json}=    Get Json Response    ${response}
    Should Be Equal As Integers    ${json}[id]    ${post_id}
    Should Not Be Empty    ${json}[title]
