param(
    [string]$FolderPath
)

# Get all files in the specified folder that have the .csproj extension
$files = Get-ChildItem -Path $FolderPath -Filter *.csproj -Recurse

# Define a regular expression pattern to match the text we're looking for
$pattern = '<PackageReference Include="(.*?)" Version="(.*?)" />'

# Initialize an array to hold the distinct package references
$distinctPackageReferences = @()

# Loop through each file and check if it contains the text we're looking for
foreach ($file in $files) {
    
    $content = Get-Content $file.FullName
    $matches = Select-String -InputObject $content -Pattern $pattern -AllMatches | 
               Select-Object -ExpandProperty Matches
    
    foreach ($match in $matches) {

        $packageName = $match.Groups[1].Value
        $currentVersion = $match.Groups[2].Value

        if ($distinctPackageReferences -notcontains $match.Value) {
            
            $apiUrl = "https://api.nuget.org/v3-flatcontainer/$packageName/index.json"
            $apiResponse = Invoke-RestMethod $apiUrl

            if ($apiResponse.versions) {
                $latestVersion = $apiResponse.versions[-1]
                
                if ($latestVersion -eq $currentVersion) {
                    $color = "Green"
                } else {
                    $color = "DarkYellow"
                }

            } else {
                $latestVersion = "UNKNOWN"
                $color = "Red"
            }
            
            $distinctPackageReferences += $match.Value
            
            if ($color -ne "Green")
            {
                Write-Host $match.Value "     " $latestVersion -ForegroundColor $color
            }
            
        }
    }
}
