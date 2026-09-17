#CADASTRO DE USUÁRIO
Dado('que estou na página de cadastro') do
    @signup_page.openPage
end

Dado('que removo todos os usuários do banco de dados') do
  @database.apagar_todos_usuarios
end

Dado('que tenho o seguinte usuário cadastrado:') do |table|
  @database.inserir_usuario(table.rows_hash)
end

Quando('preencho o formulário de cadastro com dados válidos:') do |table|
  @dadosUser = table.rows_hash
  @signup_page.fillForm(@dadosUser)
end

Quando('clico no botão de cadastro') do
  @signup_page.submitForm
end

Então('devo ver uma mensagem de boas-vindas') do
  @signup_page.validationMessage
end

#CADASTRO COM USUÀRIO DUPLICADO
Então('devo ver uma mensagem de erro {string}') do |messageError|
  @signup_page.validatioerrorMessageDuplecateEmail
end

