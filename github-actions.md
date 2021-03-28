# GitHub Actions

## Prerequisites
1. An existing user account in GitHub
2. git installed in your local computer
3. Visual Studio Code installed in your local computer

## Procedure

### Repository in GitHub
1. Create a repository in GitHub
2. Copy the link of the repository. Ex: https://github.com/barruka/test-github-actions.git
3. In your local computer, clone the repository:
    1. Open command line
    2. Navigate to a folder where you want to store locally the repository
    3. Clone the repository: `git clone https://github.com/barruka/test-github-actions.git`
5. Navigate to the folder. It must be empty because the repository was empty, newly created
6. Copy the code of your application to this folder. There is other possibilities to directly add github as a remote to an existing folder, but this is the EASY WAY (it's up to you)

### .gitignore
1. Open the folder in Visual Studio Code, or another text editor
2. Add a git ignore file (starts with a dot): `.gitignore`
3. Two possibilites: 
    1. Navigate to `https://gitignore.io` and type in "VisualStudio", hit CREATE button and copy the generated code
    2. Install `gitignore Extension for VisualStudio Code from CodeZombie`. Once installed: F1 key, Add gitignore, VisualStudio, Append
4. Still in `.gitignore` find `# User-specific files` section and add at the end of the section a new line: `.vs`
5. Commit and Push

### actions

