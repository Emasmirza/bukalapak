*** Settings ***
Resource    pages/LoginPage.robot


*** Keywords ***
############# Browser  ##########
Open Browser With Timeout
    [Timeout]                                120 Second
    Open Browser                             ${HOME URL}                                    ${BROWSER}
    Sleep                                    5
   