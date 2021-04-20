# How to create a common library and use it in nuget

1. Open VSCode
2. Open a terminal
3. Navigate to the main folder of your development project and create a subfolder: **Your_Project_Name.Common**
4. Navigate to the folder **Your_Project_Name.Common**
5. Open folder with VSCode **Your_Project_Name.Common**
6. Create **src** subfolder and navigate to it
7. `donet new classlib -n **Your_Project_Name.Common**`
8. Check if OmniSharp Server is running: Browse files an click in Class1.cs. On the bottom left side corner you must find a **flame icon** that represents OmniSharp Server.
9. Menu **`View > Command Palette > .NET Generate Assets for Build and Debug`**
10. Browse for **.vscode** and click to edit on **tasks.json**
11. In section **tasks** after **"problemMatcher": "$msCompile"** add:
12. ` , "group": { "kind": "build", "isDefault": true }`
13. In the terminal, navigate to src/**Your_Project_Name.Common**
14. 
15. 
  
