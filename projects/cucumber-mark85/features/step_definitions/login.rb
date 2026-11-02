#cenario Login com sucesso
Dado('que ja tenha criado uma conta') do
    @database.apagar_todos_usuarios
    @login_page.preCadastro
end

Dado('que estou na página de login') do
  @login_page.validarpageLogin
end

Quando('eu preencho com dados ja cadastrados:') do |table|
  @dadosUser = table.rows_hash
  @login_page.fillForm(@dadosUser)
end

Então('devo ser redirecionado para a página de tarefas') do
  @login_page.validartextpage
end

#login com email ou senha incorretos
Quando('eu preencho com dados invalidos:') do |table|
    @dadosUser = table.rows_hash
    @login_page.fillForm(@dadosUser)
end

Então('devo ver uma mensagem de erro') do
  @login_page.validarmessageerror
end