*** Settings ***

Library                AppiumLibrary                              run_on_failure=Capture Page Screenshot

*** Variables ***

${REMOTE_URL}          http://localhost:4723/wd/hub
${PLATFORM_NAME}       Android
${PLATFORM_VERSION}    9.0
${DEVICE_NAME}         192.168.56.101:5555
${APP}                 Documents/apk/bukalapak-test.apk
${PACKAGE_NAME}        #input your package here


*** Test Case ***

Filter Function

    [Arguments]         ${POSITION}
    Open Application    ${REMOTE_URL}        platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    app=${APP}    automationName=appium    appPackage=${PACKAGE_NAME}

    [TearDown]          Close Application

    #======== Sorry, I can't finish this test. Appium installion has failed :( ========