*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://demo.playwright.dev/todomvc/

*** Test Cases ***
Open Todo App And Add Items
    New Browser    chromium    headless=${False}
    New Context
    New Page    ${URL}

    Wait For Elements State    input.new-todo    visible
    Fill Text    input.new-todo    Buy milk
    Press Keys    input.new-todo    Enter

    Fill Text    input.new-todo    Learn Robot Framework
    Press Keys    input.new-todo    Enter

    # Verify items exist
    Get Text    css=ul.todo-list li:nth-child(1) label    ==    Buy milk
    Get Text    css=ul.todo-list li:nth-child(2) label    ==    Learn Robot Framework

    Close Browser
