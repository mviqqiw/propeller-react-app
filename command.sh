
#!/bin/bash

# REPO_URL https://github.com/mviqqiw/propeller-react-app

# 1. Create React App
npx create-react-app propeller-react-app
cd propeller-react-app

# Git configuration
git config --global user.name "mviqqiw"
git config --global user.email "357233071+mviqqiw@users.noreply.github.com"

# 2. Initialize repository and commit
git init
git branch -M master
git add .
git commit -m "Initial React application"

# 3. Create public GitHub repository
gh repo create propeller-react-app --public --source=. --remote=origin --push

# 4. Create update_logo branch
git switch -c update_logo

# 5. Download Propeller logo
curl -L "https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -o src/logo.svg

# 6. Update link in src/App.js
# URL: https://www.propelleraero.com/dirtmate/
# Link text: Visit DirtMate
# App.css styling adjusted in VS Code

# 7. Commit and push changes
git add .
git commit -m "Update logo to Propeller and link to DirtMate"
git push -u origin update_logo

# 8. Create and merge Pull Request
gh pr create --base master --head update_logo --title "Update Propeller logo and DirtMate link" --body "Replace React logo and update DirtMate link."

gh pr merge 1 --merge
