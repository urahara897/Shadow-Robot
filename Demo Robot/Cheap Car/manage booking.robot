*** Settings ***

Library  SeleniumLibrary
Suite Setup    Browser
Suite Teardown     Close Browser

*** Variables ***

${Browser}           Firefox
${URL}               http://ww7.demoaut.com
${navigate_frame}    xpath://*[@id='master-1']
${javascript}        window.scrollTo(0, document.body.scrollHeight)
${cheap_car}         xpath://span[text()='Cheap Car Rentals Airport']
${navigate}          xpath://span[text()='➤ Visit Website'] 
${accept}            xpath://*[@id='onetrust-accept-btn-handler']

*** Test Cases ***
tc1

    Set Browser Implicit Wait    30
    Title Should Be    Demoaut.com
    Select Frame       ${navigate_frame}
    Execute Javascript  ${javascript}
    Click Element    ${cheap_car}

tc2

    ${navigate_frame}=    Set Variable    xpath://*[@id='master-1']
    Set Browser Implicit Wait    30
    Sleep    5
    Reload Page
    Title Should Be    Demoaut.com
    Select Frame    ${navigate_frame}
    Click Element    ${navigate}

Manage_booking

    Set Browser Implicit Wait    30
    Switch Window    locator=NEW
    Sleep    3
    Click Element    ${accept}
    Click Element    xpath://*[@id='rch-select-manage-booking']
    Page Should Contain    If you don’t have an account, you can still manage your booking.
    Input Text    xpath://*[@name='tmp_email']    demo@gmail.com
    Input Text    xpath://*[@name='tmp_reference']    123456789
    Click Element    xpath://*[@value='Go']
    Sleep    4
    

*** Keywords ***
Browser
    Open Browser    ${url}    Firefox 