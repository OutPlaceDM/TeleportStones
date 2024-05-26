. ".\build\PreparePackData.ps1"
. ".\build\Zip.ps1"
. ".\build\ModelExporter.ps1"

$buildPath = ".\temp"
$configPath = ".\exportconfig.json"
$exportPath = ".\output"

# Read config
if (-not (Test-Path $configPath)) {
    Throw "unable to find " + $configPath
}

$config = Get-Content -Path $configPath | ConvertFrom-Json
$extensionname = $config.name + " - v" + $config.version;

# Cleanup temp directory and prepare it
if (Test-Path $buildPath) {
    Remove-Item -Path $buildPath -Recurse -Force
    Write-Output "Removed not properly cleaned up building directory"
}
New-Item -Path $buildPath -ItemType Directory
New-Item -Path "$buildPath\assets\minecraft\textures\block" -ItemType Directory
New-Item -Path "$buildPath\assets\minecraft\models\item" -ItemType Directory

# Build and add pack.mcmeta file
Add-PackMcMetaFile $config.metadata "$buildPath\pack.mcmeta"

# Add Textures
Copy-Item -Path ".\src\Textures\*.png" -Destination "$buildPath\assets\minecraft\textures\block"

# Add Pack preview
Copy-Item -Path ".\src\Assets\thumbnail.png" -Destination "$buildPath\pack.png"

# Add ItemFrameOverwrite
Add-ItemFrameOverwrite "$buildPath\assets\minecraft\models\item\item_frame.json"

# For every model
$directories = Get-ChildItem -Path ".\src\**" -Recurse -Filter "modelconfig.json"
foreach ($directory in $directories) {
    $directorypath = Split-Path -Path $directory -Parent
    $modelconfig = Get-Content -Path $directory | ConvertFrom-Json

    $modelfile = Get-ChildItem -Path $directoryPath -Filter "*.json" | Where-Object { $_.Name -ne "modelconfig.json" } | Select-Object -First 1

    Copy-Item -Path "$directorypath\$modelfile" -Destination "$buildPath\assets\minecraft\models\item\$modelfile"
    FixStandardExportJson "$buildPath\assets\minecraft\models\item\$modelfile"

    Add-CustomModelDataToItemFrame $modelfile "$buildPath\assets\minecraft\models\item\item_frame.json" $modelconfig
}

# Pack temp into final zip file
Add-ZipedMcPack "$buildPath\**" "$exportPath" "$extensionname.zip"


# Cleanup temp directory
Remove-Item -Path $buildPath -Recurse -Force

