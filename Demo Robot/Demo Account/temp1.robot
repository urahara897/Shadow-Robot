*** Settings ***

Library  SeleniumLibrary
Suite Setup    Browser
Suite Teardown     Close Browser

*** Variables ***

${Browser}           Firefox
${URL}               http://ww7.demoaut.com
${navigate_frame}    xpath://*[@id='master-1']
${javascript}        window.scrollTo(0, document.body.scrollHeight)
${demo_ac}          xpath://span[text()='Demo Software']
${navigate}          xpath://span[text()='➤ Visit Website'] 
${result}            xpath://*[@class='p_ si27 ']
#${select_frame}      xpath://*[@id='master-1']

*** Test Cases ***
tc1
    Set Browser Implicit Wait    30
    Title Should Be    Demoaut.com
    Select Frame       ${navigate_frame}
    Execute Javascript  ${javascript}
    Click Element    ${demo_ac}

tc2
    ${navigate_frame}=    Set Variable    xpath://*[@id='master-1']
    Set Browser Implicit Wait    30
    Sleep    5
    Reload Page
    Title Should Be    Demoaut.com
    Select Frame    ${navigate_frame}
    Click Element    ${navigate}

Search
    Set Browser Implicit Wait    30
    Switch Window    locator=NEW
    Sleep    3
    Page Should Contain    Searchley uses functional cookies and non-personalized content.
    Input Text    //*[@class='search-field__query-input']    Demo
    Click Element    xpath://*[@class='search-field__submit-button vsi']
    Sleep    4
    Select Frame    ${navigate_frame}
    Sleep   3
    Page Should Contain    Searchley uses functional cookies and non-personalized content.
    Click Element    ${result}
    #Click Element    xpath://*[@class='i_ si32 '][0]
    Sleep    5

*** Keywords ***
Browser
    Open Browser    ${url}    Firefox 