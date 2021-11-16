*** Keywords ***
#   Keywords for test setup and teardown for test with selenium

#--- setup and teardown------------
Suite preparation
    ${driver}=                      Run keyword             Open ${mode} Chrome
    Set Global Variable             ${driver}

Suite Close
    [Arguments]         ${Ndriver}=${driver}
    Close Driver        ${Ndriver}
    Run Keyword If All Tests Passed     Wait Until Keyword Succeeds     10 x    1 s   delete a user by api

Test preparation
    ${driver}=                      Run keyword             Open ${mode} Chrome
    Set Global Variable             ${driver}


#----- add pet ------------

Create a new pet by selenium
    To This Page            ${driver}       ${BASE_URL}
    click this button       ${driver}       ${ADDPET_OPERATION_BUTTON}
    Sleep   1 s
    click this button       ${driver}       ${ADDPET_OPERATION_TRY_IT_OUT_BUTTON}
    send text to element    ${driver}       ${ADDPET_OPERATION_TRY_IT_OUT_TEXTAREA_FIELD}       ${mypet}
    click this button by Enter       ${driver}       ${ADDPET_OPERATION_EXECUTE_BUTTON}
    Sleep   1 s
    ${responseCode}=        get element text    ${driver}       ${ADDPET_OPERATION_RESPONSE_CODE}
    Should contain     ${responseCode}     200
    ${responseBody}=        get element text    ${driver}       ${ADDPET_OPERATION_RESPONSE_BODY}
    Should contain     ${responseBody}     newt
    ${responseHeaders}=        get element text    ${driver}       ${ADDPET_OPERATION_RESPONSE_HEADERS}
    Should contain     ${responseHeaders}     application/json