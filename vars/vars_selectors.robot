*** Variables ***
#################################################################
# All selector variables are defined here for swagger petstore.
#################################################################
${ADDPET_OPERATION_BUTTON}                      div#operations-pet-addPet button
${ADDPET_OPERATION_TRY_IT_OUT_BUTTON}           div#operations-pet-addPet button.try-out__btn
${ADDPET_OPERATION_TRY_IT_OUT_TEXTAREA_FIELD}       div#operations-pet-addPet textarea.body-param__text
${ADDPET_OPERATION_EXECUTE_BUTTON}              div#operations-pet-addPet button.execute
${ADDPET_OPERATION_RESPONSE_CODE}              div#operations-pet-addPet table.live-responses-table tr.response td.response-col_status

${CREATEUSERWITHLIST_TRYITOUT_BUTTON}       div#operations-user-createUsersWithListInput >> text="Try it out"
${CREATEUSERWITHLIST_BODY_TEXTAREA}         div#operations-user-createUsersWithListInput textarea
#${CREATEUSERWITHLIST_BODY_EXECUTE_BUTTON}   div#operations-user-createUsersWithListInput button.execute
${CREATEUSERWITHLIST_BODY_EXECUTE_BUTTON}   div#operations-user-createUsersWithListInput >> "Execute"
