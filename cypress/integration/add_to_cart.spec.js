/// <reference types="cypress" />

describe('Jungle app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')
  })
  
  // it("There is products on the page", () => {
  //   cy.get(".products article").should("be.visible");
  // });

  // it("There is 12 products on the page", () => {
  //   cy.get(".products article").should("have.length", 12);
  // });

  it('allows user to click on cart and increases the cart by one', () => {
    
    cy.get('.products article').first().click()
    cy.wait(500)
    cy.get('.btn').click()
    cy.get('.end-0 > .nav-link').contains('(1)')
  });
})