*** Variables ***
#################################################################
# All selector variables are defined here for used urls.
#################################################################
# baseurl defined in cmd-line
${BASE_URL}          ${baseurl}
#${BASE_URL}               https://petstore.swagger.io
${create_user_url}         ${BASE_URL}/v2/user
${get_a_user_by_username_url}     ${BASE_URL}/v2/user/${user_1.username}
${delete_user_url}         ${BASE_URL}/v2/user/${user_1.username}
${user_logout_url}        ${BASE_URL}/v2/user/logout
#${user_login_url}         ${BASE_URL}/v2/user/login?username=${username}&password=${password}
${user_login_url}         ${BASE_URL}/v2/user/login
${add_pet_url}            ${BASE_URL}/v2/pet
${find_a_pet_by_id_url}     ${BASE_URL}/v2/pet/${newt.id}
${find_a_pet_by_xid_url}     ${BASE_URL}/v2/pet/888
#${delete_a_pet_by_id_url}     ${BASE_URL}/v2/pet/${newt.id}