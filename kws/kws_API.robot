*** Keywords ***
# Keywords for API tests

create a user by api
    ${status}=      Send post request        ${create_user_url}     ${user_1}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}

find a user by username by api
    ${status}=      Send get request        ${get_a_user_by_username_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    log many    ${status.text}

delete a user by api
    ${status}=      Send delete request        ${delete_user_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}

log in petstore by api
    ${status}=      Send get request        ${user_login_url}     ${auth}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}

Log out petstore by api
    ${status}=      Send get request        ${user_logout_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}

Create a new pet by api
    ${status}=      Send post Request   ${add_pet_url}      ${newt}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    Should be equal as Strings       ${status.json()['name']}      ${newt.name}
    Should be equal as Strings       ${status.headers['content-type']}       application/json

Create a new pet with missing photoUrls field by api
    ${status}=      Send post Request   ${add_pet_url}      ${newt_x}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    Should be equal as Strings       ${status.json()['name']}      ${newt_x.name}
    Should be equal as Strings       ${status.headers['content-type']}       application/json

Create a new pet only with few important fields by api
    ${status}=      Send post Request   ${add_pet_url}      ${newt_xx}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    Should be equal as Strings       ${status.json()['name']}      ${newt_xx.name}
    Should be equal as Strings       ${status.headers['content-type']}       application/json

Create a new pet only with name by api
    ${status}=      Send post Request   ${add_pet_url}      ${newt_name_only}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    Should be equal as Strings       ${status.json()['name']}      ${newt_name_only.name}
    Should be equal as Strings       ${status.headers['content-type']}       application/json
    log to console    Given id: ${status.json()['id']}

Create a new pet only with id by api
    ${status}=      Send post Request   ${add_pet_url}      ${newt_id_only}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    Should be equal as Strings       ${status.json()['id']}      ${newt_id_only.id}
    Should be equal as Strings       ${status.headers['content-type']}       application/json

Find a pet by id by api
    ${status}=      Send get request        ${find_a_pet_by_id_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    Should be equal as Strings       ${status.json()['name']}      ${newt.name}
    Should be equal as Strings       ${status.headers['content-type']}       application/json
    log many    ${status.text}

Find a pet by unexisted id by api
    ${status}=      Send get request        ${find_a_pet_by_xid_url}     ${EMPTY}
    Should be equal as Strings       ${status.json()['message']}      Pet not found
    Should be equal as Integers      ${status.status_code}   200    This case should be always failed because of ${status.text}

Find a pet by id but missing name by api
    ${status}=      Send get request        ${find_a_pet_by_id_missing_name_url}     ${EMPTY}
    Should be equal as Integers       ${status.json()['id']}      6054323
    Should be equal as Integers      ${status.status_code}   200    ${status.text}

Delete a pet by id by api
    ${status}=      Send delete request        ${find_a_pet_by_id_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   200    ${status.text}
    Should be equal as Strings       ${status.json()['message']}      ${petid.id}
    Should be equal as Strings       ${status.headers['content-type']}       application/json
    log many    ${status.text}

Check a pet has been deleted by api
    ${status}=      Send get request       ${find_a_pet_by_id_url}     ${EMPTY}
    Should be equal as Integers      ${status.status_code}   404    ${status.text}
    log many    ${status.text}