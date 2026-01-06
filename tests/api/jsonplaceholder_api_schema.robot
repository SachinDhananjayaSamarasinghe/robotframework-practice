*** Settings ***
Library    libraries.qa_library.QALibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Validate Post Response Schema And Business Rules
    ${response}=    Get Request    ${BASE_URL}/posts/1
    Validate Status Code    ${response}    200

    ${json}=    Get Json Response    ${response}

    Validate Post Schema    ${json}
    Validate Post Business Rules    ${json}
