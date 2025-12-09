*** Settings ***
Library    libraries.qa_library.QALibrary

*** Test Cases ***
Validate JSON Data
    ${data}=    Load JSON    sample.json
    ${name}=    Get Json Value    ${data}    name
    Should Be Equal    ${name}    TestUser

    ${role}=    Get Json Value    ${data}    role
    Should Contain    ${role}    QA

    ${exp}=    Get Json Value    ${data}    experience
    Should Be True    ${exp} >= 1

Generate And Check Random Id
    ${id}=    Generate Random Id
    Log    Generated ID: ${id}
    Length Should Be    ${id}    8
