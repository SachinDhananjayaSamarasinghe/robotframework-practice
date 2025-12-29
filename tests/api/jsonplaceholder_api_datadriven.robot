*** Settings ***
Library    libraries.qa_library.QALibrary
Resource   data/post_ids.robot
Test Template    Validate Post By Id

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Valid Post IDs
    1
    2
    3
    10

Invalid Post IDs
    99999
    123456

*** Keywords ***
Validate Post By Id
    [Arguments]    ${post_id}
    ${response}=    Get Request Allow Failure    ${BASE_URL}/posts/${post_id}

    Run Keyword If    ${post_id} < 10000
    ...    Validate Response Status Code    ${response}    200
    ...  ELSE
    ...    Validate Response Status Code    ${response}    404
