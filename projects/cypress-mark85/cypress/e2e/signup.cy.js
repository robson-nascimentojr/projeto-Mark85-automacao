/// <reference types="cypress" />

context('Funcionalidade de Signup', () => {
    it('Devo fazer cadastro com sucesso', () => {
        cy.visit('http://localhost:3000/signup')

        cy.get('#name').type('Robinho Junior')
        cy.get('#email').type('robinho.junior@example.com')
        cy.get('#password').type('SecurePassword123!')
        cy.get('button[type="submit"]').click()
        // cy.get('div.notice.success p').should('eq', 'Boas vindas ao Mark85, o seu gerenciador de tarefas.')
    })
    it ('Deve exibir mensagem de erro ao inserir dados já cadastrados', () => {
        cy.visit('http://localhost:3000/signup')
        cy.insertUser('Testes Nascimento', 'testes.nascimento@gmail.com', 'SecurePassword123!')
        cy.get('#name').type('Testes Nascimento')
        cy.get('#email').type('testes.nascimento@gmail.com')
        cy.get('#password').type('SecurePassword123!')
        cy.get('button[type="submit"]').click()

        cy.get('div.notice.error p').should('contain', 'Oops! Já existe uma conta com o e-mail informado.')
        cy.get('div.notice.error p').should('be.visible')
        cy.get('.notice.error p').should('contain.text', 'Oops! Já existe uma conta com o e-mail informado.')
    })
})

