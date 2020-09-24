*** Settings ***
Resource                    ../Variables.robot
Resource                    ../Settings.robot
Resource                    ../Keywords.robot

*** Variable ***
${EMAIL_FACEBOOK}           emas.mirza@gmail.com
${EMAIL_GOOGLE}             emas.mirza@gmail.com
${PASSWORD_FACEBOOK}        chelsea003
${PASSWORD_GOOGLE}          D17M09Y1993
${PROFILE_CHANGE_BANNER}    .profile__change-banner


*** Keywords ***
Verify User Has Logged In
    Wait Until Element Is Visible       sizzle=${DROPDOWN_USER} img
    sleep                               1
    Location Should Contain             ${HOME URL}

Verify Adult Popup Content
    Close Window
    Select Window
    Wait Until Element Is Visible       sizzle=${ADULT_POP_CONTENT}
    Click Element                       sizzle=${ADULT_POP_NEXT}

Verify Age Profile With Facebook
    Wait Until Page Contains Element    css=${PROFILE_CHANGE_BANNER}    timeout=60
    Textfield Value Should Be           birthday                        01/01/1990



