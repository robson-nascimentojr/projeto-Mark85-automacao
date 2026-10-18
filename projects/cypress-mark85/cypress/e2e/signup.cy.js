/// <reference types="cypress" />

describe('signup', ()=> {
    it('Devo fazer cadastro com sucesso', () => {
        cy.visit('http://localhost:3000/signup')

        cy.get('#name').type('Robinho Junior')
        cy.get('#email').type('robinho.junior@example.com')
        cy.get('#password').type('SecurePassword123!')
        cy.get('button[type="submit"]').click()
        // cy.get('div.notice.success p').should('eq', 'Boas vindas ao Mark85, o seu gerenciador de tarefas.')
    })
})