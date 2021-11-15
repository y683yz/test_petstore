*** Keywords ***
create a user by api
    ${status}=      Send post request        ${create_user_url}     ${user_1}
    Should be equal as Integers      ${status.status_code}   200

find a user by username by api
    ${status}=      Send get request        ${get_a_user_by_username_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200
    log many    ${status.text}

delete a user by api
    ${status}=      Send delete request        ${delete_user_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200

log in petstore by api
    ${status}=      Send get request        ${user_login_url}     ${auth}
    Should be equal as Integers      ${status.status_code}   200

Log out petstore by api
    ${status}=      Send get request        ${user_logout_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200

Create a new pet by api
    ${status}=      Send post Request   ${add_pet_url}      ${newt}
    Should be equal as Integers      ${status.status_code}   200

Find a pet by id by api
    ${status}=      Send get request        ${find_a_pet_by_id_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200
    log many    ${status.text}

Delete a pet by id by api
    # The body does not affect the results, as the id defined in the url
    #${status}=      Send delete request        ${find_a_pet_by_id_url}     json=${petid}
    ${status}=      Send delete request        ${find_a_pet_by_id_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200
    log many    ${status.text}

Check a pet has been deleted by api
    ${status}=      Send get request       ${find_a_pet_by_id_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   404
    log many    ${status.text}