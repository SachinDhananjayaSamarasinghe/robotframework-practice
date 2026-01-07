*** Settings ***
Library    libraries.qa_library.QALibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Validate All Posts In Collection
    ${response}=    Get Request    ${BASE_URL}/posts
    Validate Status Code    ${response}    200

    ${posts}=    Get Json Response    ${response}
    Validate Posts Collection    ${posts}
