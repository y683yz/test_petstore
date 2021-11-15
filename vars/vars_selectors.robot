*** Variables ***
###################################################################
# All POM selector variables are defined here for swagger petstore.
###################################################################
${ADDPET_OPERATION_BUTTON}                      div#operations-pet-addPet button
${ADDPET_OPERATION_TRY_IT_OUT_BUTTON}           div#operations-pet-addPet button.try-out__btn
${ADDPET_OPERATION_TRY_IT_OUT_TEXTAREA_FIELD}       div#operations-pet-addPet textarea.body-param__text
${ADDPET_OPERATION_EXECUTE_BUTTON}              div#operations-pet-addPet button.execute
${ADDPET_OPERATION_RESPONSE_CODE}              div#operations-pet-addPet table.live-responses-table tr.response td.response-col_status
${ADDPET_OPERATION_RESPONSE_BODY}              div#operations-pet-addPet table.live-responses-table tr.response td.response-col_description code
${ADDPET_OPERATION_RESPONSE_HEADERS}       div#operations-pet-addPet table.live-responses-table tr.response td.response-col_description pre.microlight>span:nth-child(4)
