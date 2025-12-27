*** Settings ***
Library    libraries.qa_library.QALibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Non Existing Post Should Return 404
    ${response}=    Get Request Allow Failure    ${BASE_URL}/posts/999999
    Validate Response Status Code    ${response}    404

Invalid Endpoint Should Return 404
    ${response}=    Get Request Allow Failure    ${BASE_URL}/invalidendpoint
    Validate Response Status Code    ${response}    404

Verify Error Response Is Not Empty
    ${response}=    Get Request Allow Failure    ${BASE_URL}/posts/999999
    Should Not Be Empty    ${response.text}
