#!/bin/bash

# Project name
PROJECT_NAME="express-ts-prisma-auth"

# Create project folder
mkdir $PROJECT_NAME
cd $PROJECT_NAME || exit

# Create main folders
mkdir -p src/{config,controllers,middlewares,routes,types}
mkdir -p prisma

# Create empty files
touch src/index.ts
touch src/config/prisma.ts
touch src/controllers/auth.controller.ts
touch src/middlewares/auth.middleware.ts
touch src/routes/auth.routes.ts
touch src/types/express.d.ts
touch prisma/schema.prisma
touch .env

# Initialize Node.js project
npm init -y

# Install dependencies
npm install express prisma @prisma/client bcrypt jsonwebtoken cors
npm install -D typescript ts-node-dev @types/node @types/express @types/jsonwebtoken @types/cors @types/bcrypt

# Initialize TypeScript config
npx tsc --init

# Initialize Prisma
npx prisma init

# Update tsconfig.json rootDir & outDir
sed -i 's#"rootDir": "./"#"rootDir": "./src"#' tsconfig.json
sed -i 's#"outDir": "./"#"outDir": "./dist"#' tsconfig.json

echo "✅ Project structure created successfully!"
echo "📂 Navigate to $PROJECT_NAME and start coding!"
