############# MANDATORY INCLUDES #############
*** Settings ***
Test Setup       Open Browser To Login Page
Test Teardown    Close Browser
Resource         ../resources/PageImporter.robot

*** Test Case ***
Login With Facebook
    [Documentation]                                      As user, I want to login to the site with my facebook account
    Keywords.Click Social Media Login Button             Facebook
    Keywords.Input Facebook Login Attribute
    Keywords.Click Facebook Login Button
    #Keywords.Click Facebook Ya
    #Keywords.Verify Page After Login
    #Keywords.Check Drop Down Menu
    debug
    Keywords.Logout

Login With Google Plus
    [Documentation]                                      As user, I want to login to the site with my google account
    Keywords.Click Social Media Login Button             Google
    Keywords.Input And Submit Google+ Login Attribute
    #Keywords.Verify Page After Login
    #Keywords.Open Drop Down Menu
    debug
    Keywords.Logout