*** Settings ***
Documentation    Suite description: Testing petStore API and UI
Resource            ../settings/initial_settings.robot
Suite Setup         Suite preparation
Test Setup          None
Test Teardown       None
Suite Teardown      Suite Close


*** Test Cases ***

Create account
    create a user by api

Find account by username
    wait Until Keyword Succeeds     10 x    1 s   find a user by username by api

Create a pet by API
    create a new pet by api
    Create a new pet with missing photoUrls field by api
    Create a new pet only with few important fields by api
    Create a new pet only with name by api
    Create a new pet only with id by api

Create a pet by Selenium
    create a new pet by selenium

Find a pet by ID
    wait Until Keyword Succeeds     10 x    1 s   find a pet by id by api
    wait Until Keyword Succeeds     10 x    1 s   find a pet by id but missing name by api

Delete a pet by ID
    wait Until Keyword Succeeds     10 x    1 s   delete a pet by id by api

Check pet has been deleted
    wait Until Keyword Succeeds     10 x    1 s   Check a pet has been deleted by api

Logout petstore
    logout petstore by api

Login perstore
    log in petstore by api
    wait Until Keyword Succeeds     10 x    1 s   find a user by username by api

Try to find an unexisted pet
    find a pet by unexisted id by api