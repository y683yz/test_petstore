*** Variables ***
#################################################################
# All selector variables are defined here for users.
#################################################################

&{user_1}    id=11    username=yang1   firstname=yonghao  lastname=yang   email=y681yz@gmail.com  password=ab123456   phone=12345678  userstatus=1
&{user_2}    id=12    username=yang2   firstname=yonghao  lastname=yang   email=y682yz@gmail.com  password=ab123456   phone=12345678  userstatus=2

# dict access as for attribute, NOTE $ used here for dict variable
${username}     ${user_1.username}
${password}     ${user_1.password}

&{auth}     username=${username}    password=${password}

