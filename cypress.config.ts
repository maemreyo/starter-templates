import { defineConfig } from "cypress";

export default defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
      on("before:spec", (spec) => {
        // spec will look something like this:
        // {
        //   name: 'login.cy.js',
        //   relative: 'cypress/e2e/login.cy.js',
        //   absolute: '/Users/janelane/app/cypress/e2e/login.cy.js',
        // }
        console.log("Running", spec.relative);
      });
      on("before:run", (details) => {
        // details will look something like this when run via `cypress run`:
        // {
        //   config: {
        //     projectId: '12345',
        //     baseUrl: 'http://example.com/',
        //     viewportWidth: 1000,
        //     viewportHeight: 660,
        //     // ...more properties...
        //   },
        //   browser: {
        //     name: 'electron',
        //     version: '59.0.3071.115',
        //     // ...more properties...
        //   },
        //   system: {
        //     osName: 'darwin',
        //     osVersion: '16.7.0',
        //   }
        //   cypressVersion: '6.1.0',
        //   specs: [
        //     {
        //       name: 'login_cy.js',
        //       relative: 'cypress/e2e/login_cy.js',
        //       absolute: '/Users/janelane/app/cypress/e2e/login_cy.js',
        //     },
        //     // ... more specs
        //   ],
        //   specPattern: [
        //     '**/*.cy.{js,jsx,ts,tsx}'
        //   ],
        //   parallel: false,
        //   group: 'group-1',
        //   tag: 'tag-1'
        // }
        // details will look something like this when run via `cypress open`:
        // {
        //   config: {
        //     projectId: '12345',
        //     baseUrl: 'http://example.com/',
        //     viewportWidth: 1000,
        //     viewportHeight: 660,
        //     // ...more properties...
        //   },
        //   system: {
        //     osName: 'darwin',
        //     osVersion: '16.7.0',
        //   }
        //   cypressVersion: '7.0.0'
        // }
        if (details.specs && details.browser) {
          // details.specs and details.browser will be undefined in interactive mode
          console.log(
            "Running",
            details.specs.length,
            "specs in",
            details.browser.name
          );
        }
      });
      on("before:browser:launch", (browser, launchOptions) => {
        // `args` is an array of all the arguments that will
        // be passed to browsers when it launches
        console.log(launchOptions.args); // print all current args

        if (browser.family === "chromium" && browser.name !== "electron") {
          // auto open devtools
          launchOptions.args.push("--auto-open-devtools-for-tabs");
        }

        if (browser.family === "firefox") {
          // auto open devtools
          launchOptions.args.push("-devtools");
        }

        if (browser.name === "electron") {
          // auto open devtools
          launchOptions.preferences.devTools = true;
        }

        // whatever you return here becomes the launchOptions
        return launchOptions;
      });
    },
  },

  component: {
    devServer: {
      framework: "next",
      bundler: "webpack",
    },
  },
});
