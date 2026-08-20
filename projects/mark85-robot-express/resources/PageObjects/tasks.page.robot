*** Settings ***

Documentation    online

Library    Browser
Library    ../libs/database.py

*** Variables ***
${name}            Robson Junior
${email}           Jrobinho211@gmail.com
${password}        pw1234
${tarefa}          Estudar Robot
${tag1}            As 20h
${tag2}            Importante
${tag3}            Postar no GitHub

*** Keywords ***

Dado que eu ja tenha efetuado o cadastro

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

    Click    .sc-fzoLsD button

E que eu esteja na página de tarefas
    Wait For Elements State    css=.oops p    visible    5
    Get Text    css=.oops p    equal    Nenhuma tarefa cadastrada

Quando clico no botao Nova tarefa
    Click    .left a button

E preencho os campos corretamente
    Fill Text    css=.form-input input    ${tarefa}
    
    Fill Text    css=.sc-fznxsB div.rti--container input   ${tag1}
    Press Keys    css=.sc-fznxsB div.rti--container input    Enter
    
    Fill Text    css=.sc-fznxsB div.rti--container input    ${tag2}
    Press Keys    css=.sc-fznxsB div.rti--container input    Enter

    Fill Text    css=.sc-fznxsB div.rti--container input    ${tag3}
    Press Keys    css=.sc-fznxsB div.rti--container input    Enter

E clico no botao cadastrar
    Click    button.sc-Axmtr

Entao devo ver a tarefa no dashboard
    Wait For Elements State    css=.task-item    visible    4
    Get Text    css=.task-item strong    equal    ${tarefa}


E crio uma nova tarefa
    Click    .left a button
    Fill Text    css=.form-input input    ${tarefa}
    Click    button.sc-Axmtr
    Get Text    css=.task-item strong    equal    ${tarefa}

Quando clico no botão de deletar
    Click    button.item-toggle

E clico no ícone da lixeira
    Click    button.task-remove

Então devo ver a página de tarefas vazio
    Wait For Elements State    css=.oops p    visible    5
    Get Text    css=.oops p    equal    Nenhuma tarefa cadastrada