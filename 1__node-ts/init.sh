#!/bin/bash

# Check if users provided a project name
# if [ $# -eq 0 ]; then
#   echo "Usage: $0 <project_name>"
#   exit 1
# fi

# Get the project name
# project_name=$1

# Create a new directory for the project
# mkdir "$project_name"
# cd "$project_name" || exit

# Create a package.json
echo '{
  "name": "node-typescript-boilerplate",
  "version": "0.0.0",
  "description": "Minimalistic boilerplate to quick-start Node.js development in TypeScript.",
  "type": "module",
  "engines": {
    "node": ">= 20.9 < 21"
  },
  "devDependencies": {
    "@types/jest": "~29.5",
    "@types/node": "~20",
    "@typescript-eslint/eslint-plugin": "~7.6",
    "@typescript-eslint/parser": "~7.6",
    "eslint": "~8.56",
    "eslint-config-prettier": "~9.1",
    "eslint-plugin-jest": "~28.2",
    "jest": "~29.7",
    "prettier": "~3.2",
    "rimraf": "~5.0",
    "ts-api-utils": "~1.3",
    "ts-jest": "~29.1",
    "typescript": "~5.4"
  },
  "scripts": {
    "start": "node build/src/main.js",
    "clean": "rimraf coverage build tmp",
    "prebuild": "npm run lint",
    "build": "tsc -p tsconfig.json",
    "build:watch": "tsc -w -p tsconfig.json",
    "build:release": "npm run clean && tsc -p tsconfig.release.json",
    "lint": "eslint . --ext .ts --ext .mts",
    "test": "jest --coverage",
    "prettier": "prettier --config .prettierrc --write .",
    "test:watch": "jest --watch"
  },
  "author": "Matthew Ngo <ngonhuthanhtrung1409@gmail.com>",
  "license": "Apache-2.0",
  "dependencies": {
    "tslib": "~2.6"
  },
  "volta": {
    "node": "20.12.2"
  }
}' >package.json

# Install required dependencies
# npm install --save-dev typescript eslint jest @types/node @types/jest prettier volta

# Create a `tsconfig.json` file for TypeScript configuration
echo '{
  "compilerOptions": {
    "target": "es2022",
    "module": "node16",
    "lib": ["ES2022"],
    "moduleResolution": "node16",
    "rootDir": ".",
    "outDir": "build",
    "allowSyntheticDefaultImports": true,
    "importHelpers": true,
    "alwaysStrict": true,
    "sourceMap": true,
    "forceConsistentCasingInFileNames": true,
    "noFallthroughCasesInSwitch": true,
    "noImplicitReturns": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitAny": false,
    "noImplicitThis": false,
    "strictNullChecks": false
  },
  "include": ["src/**/*", "__tests__/**/*"]
}' >tsconfig.json

# Create a `tsconfig.release.json` file for Production build configuration
echo '{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "sourceMap": false,
    "removeComments": true
  },
  "include": ["src/**/*"]
}' >tsconfig.release.json

# Create a `.eslintrc.json` file for ESLint configuration
echo '{
  "env": {
    "browser": false,
    "es6": true,
    "node": true
  },
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "project": "tsconfig.json",
    "sourceType": "module",
    "ecmaVersion": 2020
  },
  "plugins": ["@typescript-eslint", "jest"],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:jest/recommended",
    "prettier"
  ],
  "rules": {
    // The following rule is enabled only to supplement the inline suppression
    // examples, and because it is not a recommended rule, you should either
    // disable it, or understand what it enforces.
    // https://typescript-eslint.io/rules/explicit-function-return-type/
    "@typescript-eslint/explicit-function-return-type": "warn"
  }
}' >.eslintrc.json

# Create a '.eslintignore' file
echo '/**/*.js' >.eslintignore

# Create a `jest.config.js` file for Jest configuration
echo 'export default {
  testEnvironment: '\''node'\'',
  preset: '\''ts-jest/presets/default-esm'\'',
  transform: {
    '\''^.+\\.m?[tj]s?$'\'': ['\''ts-jest'\'', { useESM: true }],
  },
  moduleNameMapper: {
    '\''^(\\.{1,2}/.*)\\.(m)?js$'\'': '\''$1'\'',
  },
  testRegex: '\''(/__tests__/.*|(\\.|/)(test|spec))\\.(m)?ts$'\'',
  coverageDirectory: '\''coverage'\'',
  collectCoverageFrom: [
    '\''src/**/*.ts'\'',
    '\''src/**/*.mts'\'',
    '\''!src/**/*.d.ts'\'',
    '\''!src/**/*.d.mts'\'',
  ],
};' >jest.config.js

# Create a `prettier.config.js` file for Prettier configuration
echo 'module.exports = {
  "singleQuote": true,
  "trailingComma": "all",
  "overrides": [
    {
      "files": ["*.ts", "*.mts"],
      "options": {
        "parser": "typescript"
      }
    }
  ]
};' >prettier.config.js

# Create an `editorconfig` file for EditorConfig configuration
echo 'root = true

[*]
charset = utf-8
end_of_line = lf
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
insert_final_newline = false
trim_trailing_whitespace = false

[*.{js,json,ts,mts,yml,yaml}]
indent_size = 2
indent_style = space' >.editorconfig

# Create a `volta.yml` file for Volta configuration
echo 'node:
  version: 16
  alias: node' >volta.yml

# Create a `github-actions.yml` file for GitHub Actions configuration
mkdir ".github/workflows"
echo 'name: CI

on:
  push:
    branches:
      - main

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Install dependencies
        run: npm install
      - name: Run tests
        run: npm run test
      - name: Report code coverage
        uses: codecov/codecov-action@v1' >.github/workflows/github-actions.yml

# Create a simple example of TypeScript code and unit test
mkdir src
echo 'export function add(a: number, b: number): number {
  return a + b;
}' >src/math.ts
echo 'import { add } from "./math";

describe("math", () => {
  it("adds two numbers", () => {
    expect(add(2, 3)).toBe(5);
  });
});' >src/math.test.ts

# # Create an `npm scripts` section in `package.json`
# echo '{
#   "scripts": {
#     "test": "jest",
#     "lint": "eslint src",
#     "format": "prettier --write src",
#     "build": "tsc"
#   }
# }' >>package.json

# Create a simple README.md file
echo '# Available Scripts

- `clean` - remove coverage data, Jest cache and transpiled files.
- `prebuild` - lint source files and tests before building.
- `build` - transpile TypeScript to ES6.
- `build:watch` - interactive watch mode to automatically transpile source files.
- `lint` - lint source files and tests.
- `prettier` - reformat files.
- `test` - run tests.
- `test:watch` - interactive watch mode to automatically re-run tests.

' >README.md

# Create a .gitignore file
echo '# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
lerna-debug.log*
.pnpm-debug.log*

# Diagnostic reports (https://nodejs.org/api/report.html)
report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Directory for instrumented libs generated by jscoverage/JSCover
lib-cov

# Coverage directory used by tools like istanbul
coverage
*.lcov

# nyc test coverage
.nyc_output

# Grunt intermediate storage (https://gruntjs.com/creating-plugins#storing-task-files)
.grunt

# Bower dependency directory (https://bower.io/)
bower_components

# node-waf configuration
.lock-wscript

# Compiled binary addons (https://nodejs.org/api/addons.html)
build/Release

# Dependency directories
node_modules/
jspm_packages/

# Snowpack dependency directory (https://snowpack.dev/)
web_modules/

# TypeScript cache
*.tsbuildinfo

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Optional stylelint cache
.stylelintcache

# Microbundle cache
.rpt2_cache/
.rts2_cache_cjs/
.rts2_cache_es/
.rts2_cache_umd/

# Optional REPL history
.node_repl_history

# Output of npm pack
*.tgz

# Yarn Integrity file
.yarn-integrity

# dotenv environment variable files
.env
.env.development.local
.env.test.local
.env.production.local
.env.local

# parcel-bundler cache (https://parceljs.org/)
.cache
.parcel-cache

# Next.js build output
.next
out

# Nuxt.js build / generate output
.nuxt
dist

# Gatsby files
.cache/
# Comment in the public line in if your project uses Gatsby and not Next.js
# https://nextjs.org/blog/next-9-1#public-directory-support
# public

# vuepress build output
.vuepress/dist

# vuepress v2.x temp and cache directory
.temp
.cache

# Docusaurus cache and generated files
.docusaurus

# Serverless directories
.serverless/

# FuseBox cache
.fusebox/

# DynamoDB Local files
.dynamodb/

# TernJS port file
.tern-port

# Stores VSCode versions used for testing VSCode extensions
.vscode-test

# yarn v2
.yarn/cache
.yarn/unplugged
.yarn/build-state.yml
.yarn/install-state.gz
.pnp.*

# Dependencies
node_modules/

# Coverage
coverage

# Transpiled files
build/

# VS Code
.vscode
!.vscode/tasks.js

# JetBrains IDEs
.idea/

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Misc
.DS_Store' >.gitignore

# Install the dependencies
npm install

echo "Project created successfully!"
