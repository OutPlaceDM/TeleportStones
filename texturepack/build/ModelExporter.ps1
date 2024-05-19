function Add-ItemFrameOverwrite {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $FileOutput = @"
{
    "parent": "item/generated",
    "textures": {
        "layer0": "item/item_frame"
    },
    "overrides": [
    ]
    }
"@

    $FileOutput | Set-Content -Path $FilePath
}

function FixStandardExportJson {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $jsonContent = Get-Content -Path $FilePath -Raw | ConvertFrom-Json

    # fix wrong texture location
    foreach ($key in $jsonContent.textures.PSObject.Properties.Name) {
        Write-Output $key
        $jsonContent.textures.$key = "block/" + $jsonContent.textures.$key
    }

    # add license information
    $licenceProperty = @{
        Name = '__LICENSE'
        Value = 'Licensed under GNU General Public License v3.0 - https://github.com/OutPlaceDM/TeleportStones/blob/main/LICENSE'
        MemberType = 'NoteProperty'
    }
    $jsonContent | Add-Member @LicenceProperty

    $jsonContent | ConvertTo-Json -Depth 10 | Set-Content -Path $FilePath
}


function Add-CustomModelDataToItemFrame {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FileName,

        [Parameter(Mandatory=$true)]
        [string]$FilePath,

        [Parameter(Mandatory=$true)]
        [System.Object[]]$Data
        )
        
$fileNameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($FileName)
$jsonContent = Get-Content -Path $FilePath -Raw | ConvertFrom-Json

$newOverride = [PSCustomObject]@{
    model = "item/$fileNameWithoutExtension"
    predicate = @{
        custom_model_data = $Data.custom_model_data
    }
}

# Füge das neue Override-Objekt dem overrides-Array hinzu
$jsonContent.overrides += $newOverride
    
$jsonContent | ConvertTo-Json -Depth 10 | Set-Content -Path $FilePath

}