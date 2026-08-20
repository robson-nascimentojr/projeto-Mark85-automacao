*** Settings ***

Documentation    online

Library    Browser
Library    FakerLibrary
Resource    ../resources/PageObjects/tasks.page.robot

*** Test Cases ***

Adicionar task com sucesso
    [Tags]    Add-task-sucess
    Remove user from database    ${email}

    Dado que eu ja tenha efetuado o cadastro

    E que eu esteja na página de tarefas

    Quando clico no botao Nova tarefa

    E preencho os campos corretamente

    E clico no botao cadastrar

    Entao devo ver a tarefa no dashboard

    Remove user from database    ${email}

Remover tarefa existente
    [Tags]     remove-task-exist

    Dado que eu ja tenha efetuado o cadastro

    E que eu esteja na página de tarefas

    E crio uma nova tarefa

    Quando clico no botão de deletar

    E clico no ícone da lixeira

    Então devo ver a página de tarefas vazio