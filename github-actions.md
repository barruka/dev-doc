# GitHub Actions for an .NET ASP.Net Core in AZURE

## Prerequisites
1. An existing user account in GitHub
2. git installed in your local computer
3. Visual Studio Code (VSCode from now on) installed in your local computer

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
1. Open the folder in VSCode, or another text editor
2. Add a git ignore file (starts with a dot): `.gitignore`
3. Two possibilites: 
    1. Navigate to `https://gitignore.io` and type in "VisualStudio", hit CREATE button and copy the generated code
    2. Install `gitignore Extension for VisualStudio Code from CodeZombie`. Once installed: F1 key, Add gitignore, VisualStudio, Append
4. Still in `.gitignore` find `# User-specific files` section and add at the end of the section a new line: `.vs`
5. **Commit** and **Push**

### actions
1. Install GitHub actions VSCode extension: `GitHub Actions` from Christopher Schleiden
2. VSCode will ask if add some, do it. 
3. Maybe you have to allow VScode to manage GitHub Actions. Check accounts icon on bottom left side if it is asking for permissions.
4. Close and reopen VSCode.
5. Create a new folder in folder root: `.github`
6. Inside of `.github`, create a subfolder: `workflows`
7. Inside of `workflows`, create a yaml file: `ci-cd.yaml`

> ATENTION: On March 2021 GitHub is changing **master** branch name to **main** so check the name of your main branch!

```yaml
name: Continuous Integration and Deployment

on:
  push:
    branches:
      - master

env:
  DOTNET_VERSION: '5.0.x'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Check out code
        uses: actions/checkout@v2
      
      - name: Setup .NET 5 
        uses: actions/setup-dotnet@v1
        with:
          dotnet-version: ${{ env.DOTNET_VERSION }}
     
      - name: Restore dependencies
        run: dotnet restore

      - name: Build app
        run: dotnet build -c Release --no-restore
```
8. If the app has Tests you have to add:
```yaml
      - name: Run automated tests
        run: dotnet test -c Release --no-build
```
9. Git **commit**: Add CD/CI Pipeline
10. Git **push**

### Compile the app locally to test it
1. Open a terminal inside VSCode
2. Fetches all the necessary packages from nuget.org and installs them locally: `dotnet restore`
3. Build the app: `dotnet build -c Release --no-restore`

### Actions
1. Navigate to the project in GitHub and click **ACTIONS**
2. On the left hand side: **Workflows > All workflows** must have `Continuous Integration and Deployment` (the name we gave in yaml file)
3. Click on it to see the workflows

### Create status badge
1. Navigate to the project in GitHub and click **ACTIONS**
2. On the left hand side: **Workflows > All workflows** must have `Continuous Integration and Deployment` (the name we gave in yaml file)
3. On the right hand side, click on the tree horizontal dots and select `Create status badge`
4. Click on the button **Copy status badge Markdown**
5. Go to **<> Code** and **Add file** then **Create new file**: `readme.md`
6. At the very beginning pase the status badge markdown and **Commit changes**
7. In your local computer, git **pull** to get the readme.md file

### Azure
1. After creating the **App Service** in Azure, **Get Publish Profile** file 
2. In GitHub go to **Settings** and in the left hand side click on **Secrets**
3. Click on right button **New repository secret**
4. Name: `AZURE_WEBAPP_PUBLISH_SECRET` (no spaces)
5. Value: The content of the publish settings downloaded from Azure in step 1
6. In VSCode edit .yaml file adding:
> Beware that **app-name** is the name of the **Web App** in Azure. If you want, you can create a new "env" setting to the app name.
```yaml
      - name: Publish app
        run: dotnet publish -c Release -o ./out

      - name: Deploy to Azure Web Apps
        uses: azure/webapps-deploy@v2
        with:
          app-name: apiexample
          publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_SECRET }}
          package: ./out
```
