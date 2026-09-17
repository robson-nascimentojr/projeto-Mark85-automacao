require 'capybara'
require 'capybara/cucumber'
require 'rspec'
class SignupPage
    include Capybara::DSL
    include RSpec::Matchers

    def openPage
        visit "http://localhost:3000/signup"
    end

    def fillForm(user_data)
        find('#name').set(user_data['name'])
        find('#email').set(user_data['email'])
        find('#password').set(user_data['password'])
    end

    def submitForm
        find('#buttonSignup').click
    end

    def validationMessage
        message = find('.notice.success p').text
        expect(message).to eql('Boas vindas ao Mark85, o seu gerenciador de tarefas.')
    end

    def validatioerrorMessageDuplecateEmail
        message = find('.notice.error p').text
        expect(message).to eql('Oops! Já existe uma conta com o e-mail informado.')
    end
end