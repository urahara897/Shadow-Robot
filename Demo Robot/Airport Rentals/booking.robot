*** Settings ***

Library  SeleniumLibrary
Suite Setup    Browser
Suite Teardown     Close Browser

*** Variables ***

${Browser}           Firefox
${URL}               http://ww7.demoaut.com
${navigate_frame}    xpath://*[@id='master-1']
${javascript}        window.scrollTo(0, document.body.scrollHeight)
${airport_rental}    xpath://span[text()='Cheap Car Rentals Airport']    
${navigate}          xpath://span[text()='➤ Visit Website'] 
${accept}            xpath://*[@id='onetrust-accept-btn-handler']
${country_button}    xpath://*[@id='pu-country']
#${country}              xpath://*[text()[contains(.,'India')]]
${country_text}      xpath://*[@id='pu-country']
${city}              xpath://*[contains(text(),'Bangalore')]


*** Test Cases ***

tc1
   
   
   Set Browser Implicit Wait    30
   Title Should Be    Demoaut.com
   Select Frame       ${navigate_frame}
   Execute Javascript  ${javascript}
   Click Element    ${airport_rental}
   #Sleep    2

tc2

   ${navigate_frame}=    Set Variable    xpath://*[@id='master-1']
   Set Browser Implicit Wait    30
   Sleep    5
   Reload Page
   Title Should Be    Demoaut.com
   Wait Until Page Contains Element    ${navigate_frame}
   Select Frame    ${navigate_frame}
   Click Element    ${navigate}

Booking
    
   Set Browser Implicit Wait    30
   Switch Window    locator=NEW
   Sleep    5
   Page Should Contain    Search for rental cars
   Click Element    ${accept}
   Sleep    5
   #Click Element    ${accept}
   Click Element    ${country_button}
   #Input Text    locator    text
   Sleep    4
   Click Element    ${country_button}
   #Scroll Element Into View    ${country}
   Select From List By Label    ${country_button}    India
   Sleep    4
   Click Element    xpath://*[@id='pu-city']
   Select From List By Label    xpath://*[@id='pu-city']    Bangalore 
   Click Element    xpath://*[@id='pu-location'] 
   Select From List By Label    pu-location    Bangalore International Airport
   Click Element    xpath://*[@id='formsubmit']
   Sleep    4



*** Keywords ***
Browser
    Open Browser    ${url}    Firefox 
