*** Settings ***

Documentation    online

Library    Browser
Library    FakerLibrary
Resource    ../resources/PageObjects/logout.page.robot

*** Test Cases ***

Logout com sucesso
    [Tags]    logout-success

    Remove user from database    ${email}
    
    Dado que eu ja tenha efetuado o cadastro e login

    Quando clico no ícone de desligar

    Então devo ver novamente a tela de login