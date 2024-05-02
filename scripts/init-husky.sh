#!/bin/bash

# Add devDependencies to package.json
npm install --save-dev husky lint-staged

# Add scripts to package.json
npx json -I -f package.json -e 'this.scripts["prepare-commit-msg"] = "husky run prepare-commit-msg"'
npx json -I -f package.json -e 'this.scripts["commit-msg"] = "husky run commit-msg"'
npx json -I -f package.json -e 'this.scripts["pre-commit"] = "husky run pre-commit"'


# Create.husky/pre-commit file
mkdir -p ".husky"
touch ".husky/pre-commit"
touch ".husky/commit-msg"

echo "#!/usr/bin/env sh

# Lint code before commit
npm run lint

# Run tests before commit
npm run test" >.husky/pre-commit
chmod +x.husky/pre-commit

# Create.husky/commit-msg file
echo "#!/usr/bin/env sh

# Check commit message format
npx commitizen cz --hook=true" >.husky/commit-msg
chmod +x.husky/commit-msg

# Create.lintstagedrc.json file
echo "{
  \"src/**/*.ts\": [\"npm run lint\", \"git add\"]
}" >.lintstagedrc.json

# Install husky
npx husky install

# Add pre-commit script to husky
npx husky add.husky/pre-commit

# Add commit-msg script to husky
npx husky add.husky/commit-msg

# Reminder to run npm install
echo "Please run 'npm install'."
