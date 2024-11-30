# Growing Together 🌱

Growing Together is an app that addresses the UN Sustainable Development Goal - Good Health and Well-Being. It aims to reduce infant mortality and deaths of children under 5 years of age. Also, it supports single parents in taking care of their children by providing them reliable resources on various topics surrounding parenting.

You can download the android app from github releases [here](https://github.com/parnavh/growing-together/releases)

## Demo 📽️

[![Watch walkthrough on YouTube](https://i.ytimg.com/vi/RoCqR1ulrJs/hqdefault.jpg)](https://www.youtube.com/watch?v=RoCqR1ulrJs)

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
