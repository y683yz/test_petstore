*** Settings ***
Documentation    Suite description
Resource        ${CURDIR}/../vars/vars_selectors.robot
Resource        ${CURDIR}/../vars/vars_urls.robot
Resource        ${CURDIR}/../vars/vars_pets.robot
Resource        ${CURDIR}/../vars/vars_users.robot
Resource        ${CURDIR}/../kws/kws_API.robot
Resource        ${CURDIR}/../kws/kws_selenium.robot

Library             ${CURDIR}/../src/Common.py
Library             SeleniumLibrary     timeout=10  implicit_wait=0.5
