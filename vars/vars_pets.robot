*** Variables ***
#################################################################
# All selector variables are defined here for pets.
#################################################################

&{category}     id=0    name=crawler
@{photoUrls}    thisURL
&{tag1}     id=0    name=reptile
&{tag2}     id=1    name=Cold-blooded
@{tags}     &{tag1}     &{tag2}
&{newt}     id=1100    category=&{category}    name=newt   photoUrls=@{photoUrls}  tags=@{tags}     status=available
&{newt_x}     id=1199    category=&{category}    name=newt_x     tags=@{tags}     status=available
&{newt_xx}     id=2299    name=newt_xx     status=available

&{petid}    id=${newt.id}

${mypet}    {"id":${newt.id},"category":{"id":0,"name":"crawler"},"name":"newt","photoUrls":["thisURL"],"tags":[{"id":0,"name":"reptile"},{"id":1,"name":"Cold-blooded"}],"status":"available"}
