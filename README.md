# Growing Together 🌱

Growing Together is an app that addresses the UN Sustainable Development Goal - Good Health and Well-Being. It aims to reduce infant mortality and deaths of children under 5 years of age. Also, it supports single parents in taking care of their children by providing them reliable resources on various topics surrounding parenting.

## Quick Start ⚙️

```diff
# Install dependencies
yarn install

# In prisma update schema.prisma provider to use sqlite
# or use your own database provider
- provider = "postgresql"
+ provider = "sqlite"

# Configure environment variables.
# There is an `.env.example` in the root directory you can use for reference
cp .env.example .env

# Push the Prisma schema to your database
yarn push

# Start the developement server
yarn dev
```
