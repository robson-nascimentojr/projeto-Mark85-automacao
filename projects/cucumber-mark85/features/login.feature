#language:pt

Funcionalidade: Login

    Como um usuário do mark85
    Quero fazer login no sistema
    Para que eu possa acessar minhas Tarefas

    Cenario: login com sucesso 
        Dado que ja tenha criado uma conta
            E que estou na página de login
        Quando eu preencho com dados ja cadastrados:
            | email    | teste@gmail.com  |
            | senha    | testes@semspan1  |
        Então devo ser redirecionado para a página de tarefas
    @temp  
    Cenario: Login com senha incorreta
         Dado que ja tenha criado uma conta
            E que estou na página de login
         Quando eu preencho com dados invalidos:
            | email    | teste@gmail.com  |
            | senha    | senha_incorreta  |
         Então devo ver uma mensagem de erro