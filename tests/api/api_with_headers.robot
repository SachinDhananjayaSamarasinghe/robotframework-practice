*** Settings ***
Library    libraries.qa_library.QALibrary

*** Variables ***
${ENV}    dev

*** Test Cases ***
Get Posts With Auth Header
    ${env}=    Load Environment    ${ENV}
    ${base_url}=    Set Variable    ${env}[base_url]
    ${api_key}=     Set Variable    ${env}[api_key]

    ${headers}=     Create Dictionary
    ...    Authorization=Bearer ${api_key}
    ...    Content-Type=application/json

    ${response}=    Get With Headers    ${base_url}/posts    ${headers}
    Validate Status Code    ${response}    200
