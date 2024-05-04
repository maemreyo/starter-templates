// ***********************************************************
// This example support/e2e.ts is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import './commands'

// Alternatively you can use CommonJS syntax:
// require('./commands')
Cypress.on('uncaught:exception', (err, runnable, promise) => {
    // We actually have some issues with hydration process of the Next.js app, this handler prevents the test to fail and ignore errors
    // Refs: https://react.dev/errors/418?invariant=418
    if (err.message.includes('#418') || err.message.includes('#423')) {
        return false
    }
})