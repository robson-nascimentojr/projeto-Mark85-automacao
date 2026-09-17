#language: pt

Funcionalidade: Cadastro de usuário com sucesso
    Como usuário do projeto QAmark85
    Quero me cadastrar no sistema
    Para poder acessar a plataforma

    Cenário: Cadastro de usuário com sucesso
        Dado que removo todos os usuários do banco de dados
        E que estou na página de cadastro
        Quando preencho o formulário de cadastro com dados válidos:
            |name     | Teste Junior    |
            |email    | teste@gmail.com |
            |password | pwd123          |
        E clico no botão de cadastro
        Então devo ver uma mensagem de boas-vindas
        
    Cenário: Cadastro com email já existente
        Dado que removo todos os usuários do banco de dados
        E que tenho o seguinte usuário cadastrado:
            |name     | Teste Junior    |
            |email    | Teste@gmail.com |
            |password | pwd123          |
        E que estou na página de cadastro
        Quando preencho o formulário de cadastro com dados válidos:
            |name     | Teste Junior    |
            |email    | Teste@gmail.com |
            |password | pwd123          |
        E clico no botão de cadastro
        Então devo ver uma mensagem de erro "Oops! Já existe uma conta com o e-mail informado."
