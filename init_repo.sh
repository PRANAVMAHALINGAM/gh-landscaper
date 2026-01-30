#!/bin/bash

# Initialize git repository
git init

# Add files
git add gh-landscaper README.md setup.sh

# Initial commit
git commit -m "Initial commit of gh-landscaper extension"

echo "Repository initialized. You can now push this to GitHub."
echo "  gh repo create gh-landscaper --public --source=. --push"
