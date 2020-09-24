*** Settings ***
Library    RequestsLibrary
Library    HttpLibrary.HTTP
Library    JSONLibrary

*** Variable ***
#${URL}    http://thetestingworldapi.com/
${URL}     https://jsonplaceholder.typicode.com

*** Test Case ***
GET_API
    Create Session                 Get_Details               ${URL}                          verify=true
    ${response}=                   Get Request               Get_Details                     posts

    ${json_object}                 to Json                   ${response.content}

    ${userId}=                     Get Value From Json       ${json_object}                  $.[1].userId
    ${id}=                         Get Value From Json       ${json_object}                  $.[1].id
    ${title}=                      Get Value From Json       ${json_object}                  $.[1].title
    ${body}=                       Get Value From Json       ${json_object}                  $.[1].body

    Integer Validation             ${userId[0]}
    Integer Validation             ${id[0]}
    String Validation              ${title[0]}
    String Validation              ${body[0]}

    Log To Console                 GET API : ${response}


    #Log To Console    ${response.content}
    #Log To Console    ${response}
    #${type1}                      Evaluate               type($value_str).__name__
    #${type2}                      Evaluate               type($value_number).__name__
    #Log To Console                ${type1}
    #${is int}         Evaluate               type($id)               # will be True
    #${is string}      Evaluate               isinstance($body, str)    # will be False
    #Log To Console    ${id[0]}
    #Should Be True    '${id[0]}'=='2'
    #Log To Console    ${is int}

POST_API
    Create Session                 AddData                   ${URL}                          verify=true
    &{body}=                       Create Dictionary         tittle=recommendation           body=motorcycle                       userId=12

    ${response}=                   Post Request              AddData                         posts                                 data=${body}
    ${status}=                     convert to string         ${response.status_code}
    Should Be Equal                ${status}                 201

    Log To Console                 POST API : ${response}


*** Keywords ***

String Validation
    [Arguments]                    ${text}
    ${status}                      ${value}=                 Run Keyword And Ignore Error    String Checker                        ${text}
    Run Keyword If                 '${status}' == 'PASS'     Fail                            DATA TIPE BUKAN STRING !!!!


String Checker
    [Arguments]                    ${text}
    Should Be Equal As Integers    ${text}                   ${text}

Integer Validation
    [Arguments]                    ${text}
    Should Be True                 ${text}==${text}