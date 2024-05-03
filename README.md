## Jumpstart Your Project with `starter-templates`

This repository offers a collection of pre-configured project setups, each designed to streamline development for specific technologies and tools. With these templates, you can hit the ground running by creating a new project complete with pre-installed dependencies and automated workflows, saving you valuable time and effort.

### Available Templates (Branches)

Each branch serves as a blueprint for a specific project setup. Here's what you can expect:

**node-ts (Recommended):** Ideal for Node.js projects with a modern tooling stack, this branch includes:

- **TypeScript:** Enforces strong typing for enhanced code maintainability.
- **Volta:** Manages project dependencies efficiently across different projects.
- **ESLint & Prettier:** Ensures code quality and consistency with static code analysis and automatic formatting.
- **Jest:** Unit testing framework for writing and running automated tests.
- **GitHub Actions:** Automates tasks like building, testing, and deploying your project.
- **Husky & Lint Staged:** Enforces coding standards through pre-commit hooks and linting focused on staged files.
- **CHANGELOG Generator & Commitlint:** Simplifies creation and maintenance of changelogs and ensures consistent commit messages.

**More Templates Coming Soon!**

We're actively adding more branches to cater to various project types and preferences. Your contributions are welcome!

### Getting Started in a Flash

1. **Pick the Perfect Template:** Choose the branch that aligns best with your project needs. `node-ts` is a great option for Node.js projects with a modern setup.
2. **Clone the Repository:** Use Git to clone this repository locally:

   ```bash
   git clone https://github.com/your-username/starter-templates.git
   ```

3. **Navigate to Your Project Directory:** Open your code editor and adjust the `PROJECT_DIR` variable in the `start-project.sh` script to match your preferred project location (e.g., `~/Documents/workspace/dev/projects/`).

4. **Run the Setup Script:** Ensure you have permission to run shell scripts by executing `chmod +x start-project.sh` (assuming you're in the project's root directory). Then, run the script:

   ```bash
   ./start-project.sh
   ```

   Follow the script's prompts to complete the setup.

5. **Voila! Project Ready!** The script creates a new project directory (excluding the `.git` folder). You can then add your own remote URL to manage version control.

### Contributing to `starter-templates`

We value your contributions! Here's how you can participate:

- **Create a New Branch:** Propose a new branch for a specific project setup and tooling combination.
- **Enhance Existing Branches:** Improve existing branches by adding functionality or updating dependencies.
- **Report Issues & Suggest Improvements:** Encounter any issues or have ideas for enhancements? Open an issue on this repository.

Please make sure your contributions adhere to good practices and align with the project's overall structure.

This README provides a solid foundation for using `starter-templates`. Remember to update branch details and add information for future templates as they become available.
