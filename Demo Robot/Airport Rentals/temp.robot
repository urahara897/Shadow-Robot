*** Settings ***

Library  SeleniumLibrary
Suite Setup    Browser
Suite Teardown     Close Browser
*** Variables ***

${Browser}           Firefox
${URL}               http://ww7.demoaut.com
${navigate_frame}    xpath://*[@id='master-1']
${javascript}        window.scrollTo(0, document.body.scrollHeight)
${airport_rental}    xpath://span[text()='Rent a Car Airport']    
${navigate}          xpath://span[text()='➤ Visit Website'] 
${accept}            xpath://*[@id='onetrust-accept-btn-handler']
${create_pop}         xpath://*[@id=\"rch-select-sign-in\"]/i
${create}             id:createAccountModalOpen
#${create_frame}             xpath://*[@id="CreateAccountmodal_promo"]
${create_username}    xpath://*[@id="modalCrmEmail"]
${create_password}    xpath://*[@id="modalCrmPsw"]
${create_button}      xpath://*[@class='rc-btn lg bg-green-1 txt-white loyaltyCompSignIn']
${close_create}       xpath://*[@class='a11y-normalise-button modal_promo_close']
${login_username}     xpath://*[@name='crmEmail']
${login_password}     xpath://*[@name='crmPsw']
${login_button}       xpath://*[@id='crmLogin']
#${navigate_frame1}    xpath://*[@id='master-1']

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

SignUp
   
   Set Browser Implicit Wait    30
   Switch Window    locator=NEW
   Sleep    3
   #Reload Page
   #Sleep    5
   Click Element    ${accept}
   Click Element    ${create_pop} 
   Click Element    ${create}
   Sleep    3
   Input Text    ${create_username}    demo123@gmail.com   
   Input Password    ${create_password}    Demo1234567
   Page Should Contain Button    xpath://*[@class='rc-btn lg bg-green-1 txt-white loyaltyCompSignIn']
   Click Element    ${create_button}
   Click Element    ${close_create}
   

login
   
   Set Browser Implicit Wait    30
   Sleep    4
   Click Element    ${create_pop}
   Page Should Contain    Forgotten your password?
   Input Text    ${login_username}    demo123@gmail.com
   Input Password    ${login_password}    Demo1234567
   Click Button    ${login_button}
   Sleep    5





   
*** Keywords ***
Browser
    Open Browser    ${url}    Firefox 


  

