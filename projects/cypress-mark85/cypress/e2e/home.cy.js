/// <reference types="cypress" />
describe('Home', () => {
  it('web app deve estar online', () => {
    cy.visit('http://localhost:3000/')

    cy.title().should('eq', 'Mark85 by QAx')
  })
})