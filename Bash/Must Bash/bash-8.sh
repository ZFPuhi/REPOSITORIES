#!/bin/bash

# Clone the repository
git clone https://github.com/my-repo.git
cd my-repo

# Build the application
./build.sh

# Run tests
./run-tests.sh

# Deploy to staging environment
./deploy-to-staging.sh

echo "CI pipeline completed"

# Continuous Integration Script | Set up a script that integrates code changes into a shared repository, triggers builds, and runs tests automatically.