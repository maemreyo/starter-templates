## `next-ts-cypress` template

This template utilizes various technologies to expedite your project development.

## Technologies Used

- Next.js (14.2.3) - The React framework for server-rendered and statically generated web applications.
- React & React DOM (^18)
- Typescript (^5) - A superset of JavaScript that adds optional static typing.
- Husky & Lint Staged - Enforces code style and formatting through pre-commit hooks.
- ESLint & Prettier - Tools for linting and formatting code, respectively.
- Commitizen - Streamlines the commit message creation process.
- Conventional Changelog - Standardizes the format of your project's changelog.
- Cypress (^13.8.1) - Testing your site using E2E and Component tests.
  > Note: Currently `cypress` is not supported `next ^14.0.0` officially. If you're experiencing problems, downgrade dependencies and restart Cypress.

## Installation

### Husky

Husky automates pre-commit hooks to ensure code quality.

1. Grant executable permissions to the `next-husky.sh` script:

   ```bash
   chmod +x ./scripts/next-husky.sh
   ```

2. Run the script to set up Husky:

   ```bash
   ./scripts/next-husky.sh
   ```

3. Test the process
   ```bash
   git add .
   git commit
   ```
   _Note that here we dont need to provide the `-m "Commit message"` because we use another provider to help creating the commit message_

## Available scripts

- **`dev`:** Starts the development server for your Next.js application.
- **`build`:** Builds an optimized production version of your application.
- **`start`:** Starts the production server for your application.
- **`lint`:** Runs code linters to check for stylistic and potential errors in your code.
- **`cypress`:** Opens the Cypress test runner for visual inspection.
- **`pre:e2e`:** This script runs before the end-to-end (e2e) tests. It builds and starts the production server to ensure the application is running for testing. e2e testing requires Nextjs running on the production mode.
- **`test:e2e`:** Runs the e2e tests using Cypress in headless chrome mode. The `--no-exit` flag keeps the Cypress test runner open after the tests finish.
- **`pre:cpn`:** This script runs before the component tests. It starts the development server.
- **`test:cpn`:** Runs component tests using Cypress

## Quick Development

Start the development server for live coding changes:

```bash
npm run dev
```

## FAQs
1. My E2E test always throws an error when running.

Double check if you're running the production server. Because of this [note](https://nextjs.org/docs/app/building-your-application/testing/cypress#running-e2e-tests), it recommended that you need to run the production server first before running the Cypress tests.

## Contribution

We welcome contributions from the community! Here's how you can get involved:

- **Bug reports:** If you encounter any bugs, please create an issue on the project's GitHub repository.
- **Feature requests:** Do you have an idea for a new feature? Feel free to create an issue to discuss it.
- **Pull requests:** If you've made changes that you think would benefit the project, submit a pull request.

**Before making a contribution:**

- Ensure you have reviewed the project's contribution guidelines (if available).
- Make sure your code adheres to the project's coding style.
- Write clear and concise commit messages.

We appreciate your contributions!

## Supportive

<a href="https://www.buymeacoffee.com/maemreyo" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 30px !important;width: 108px !important;" ></a>
