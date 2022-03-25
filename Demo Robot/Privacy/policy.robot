*** Settings ***

Library  SeleniumLibrary
Suite Setup    Browser
Suite Teardown     Close Browser

*** Variables ***

${Browser}           Firefox
${URL}               http://ww7.demoaut.com
${policy}            //*[contains(text(), 'Privacy Policy')]
${javascript}        window.scrollTo(0, document.body.scrollHeight)
${javascript_final}    "arguments[0].scrollIntoView(true);", //*[@class='inline-block link-button']
${policy_mid}        //*[@target='_blank']
${policy_final}      //*[@class='inline-block link-button']
${final_button}      //*[@class='main-view__option-button']


*** Test Cases ***

tc1

   Set Browser Implicit Wait    30
   Execute Javascript  ${javascript}
   Title Should Be    Demoaut.com
   Click Element    ${policy}

tc2

   Set Browser Implicit Wait    30
   Switch Window    locator=NEW   
   Page Should Contain    Privacy Policy
   Click Element    ${policy_mid}

opt_out

   Set Browser Implicit Wait    30
   Switch Window    locator=NEW
   Page Should Contain    Want to Opt Out?
   #Execute Javascript    ${javascript_final}
   Click Element    ${policy_final}
   Sleep    4

final_opt_out
   Set Browser Implicit Wait    30
   Page Should Contain    Welcome to the NAI's opt-out page
   #Switch Window    locator=NEW
   Click Element    ${final_button}
   Page Should Contain    Your connection speed and browser configuration
   Sleep    30
    

   






*** Keywords ***
Browser
    Open Browser    ${url}    Firefox 