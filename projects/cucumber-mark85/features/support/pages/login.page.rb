require 'capybara'
require 'capybara/cucumber'
require 'rspec'

class LoginPage
    include Capybara::DSL
    include RSpec::Matchers


    def openPage
        visit "http://localhost:3000/login"
    end

    def preCadastro
        visit "http://localhost:3000/signup"
        find('input#name').set('Mark')
        find('input#email').set('teste@gmail.com')
        find('input#password').set('testes@semspan1')
        find('button#buttonSignup').click
        find('div.sc-fznKkj a').click
        
    end

    def validarpageLogin
        messade = find('div.sc-fzoLsD.fYZyZu h1').text
        expect(messade).to eql('Faça seu login')
    end

    def fillForm(user_data)
        find('input#email').set(user_data['email'])
        find('input#password').set(user_data['senha'])
        find('button#buttonLogin').click
    end

    def validartextpage
        message = find('div.oops p').text
        expect(message).to eql('Nenhuma tarefa cadastrada')
    end

    def validarmessageerror
        message = find('div.notice.error p ').text
        expect(message).to eql('Ocorreu um erro ao fazer login, verifique suas credenciais.')
    end
end