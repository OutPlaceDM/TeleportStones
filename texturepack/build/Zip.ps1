function Add-ZipedMcPack {
    param (
        [Parameter(Mandatory=$true)]
        [string]$InputPath,

        [Parameter(Mandatory=$true)]
        [string]$OutputPath,

        [Parameter(Mandatory=$true)]
        [string]$OutputName
    )

    
    $compress = @{
        Path = $InputPath
        CompressionLevel = "Optimal"
        DestinationPath = "$OutputPath\$OutputName"
    }

      if (Test-Path $OutputPath) {
        Remove-Item -Path $OutputPath -Recurse -Force
        Write-Output "Removed Output directory"
    }
    
    New-Item -Path $OutputPath -ItemType Directory

    Compress-Archive @compress
}