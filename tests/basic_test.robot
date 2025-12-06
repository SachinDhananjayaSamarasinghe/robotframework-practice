*** Settings ***
Library    ../libraries/qa_library.py

*** Test Cases ***
Using New QA Keywords
    ${id}=        Generate Random Id    10
    Log           Generated ID: ${id}

    ${json}=      Read Json File        ../data/sample.json
    Log           Loaded JSON: ${json}

    Validate Status Code    200    200
    Log    Status code validated successfully!
