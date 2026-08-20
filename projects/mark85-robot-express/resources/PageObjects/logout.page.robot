*** Settings ***

Library   Browser
Library   ../libs/database.py

*** Variables ***
${name}            Robson Junior
${email}           Jrobinho211@gmail.com
${password}        pw1234
${password2}        12345

*** Keywords ***


Dado que eu ja tenha efetuado o cadastro e login

    New Browser   browser=chromium    headless=False
    New Page    http://localhost:3000
    Go To    http://localhost:3000/signup

    Wait For Elements State    css=h1    visible    5
    Get Text                  css=h1    equal    Faça seu cadastro

    Fill Text    id=name    ${name}
    Fill Text    id=email    ${email}
    Fill Text    id=password  ${password}


    Click    id=buttonSignup
    Wait For Elements State    css=.notice p    visible    5
    Get Text                  css=.notice p     equal      Boas vindas ao Mark85, o seu gerenciador de tarefas.

    click    .sc-fznKkj a

    Fill Text    id=email    ${email}
    Fill Text    id=password    ${password}

    Click    button#buttonLogin

    

Quando clico no ícone de desligar
    Click    button.signout

Então devo ver novamente a tela de login
    Wait For Elements State  css=.sc-fzoLsD.fYZyZu h1    visible    5