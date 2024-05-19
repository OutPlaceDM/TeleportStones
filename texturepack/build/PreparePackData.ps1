function Add-PackMcMetaFile {
    param (
        [Parameter(Mandatory=$true)]
        [System.Object[]]$Data,

        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $pack_format = $Data.format
    $headline_title = $Data.headlines.title
    $headline_description = $Data.headlines.description

    $FileOutput = @"
{
    "pack":
    {
        "pack_format": $pack_format,
        "description": [{ "text": "$headline_title" }, { "text": "\n$headline_description" }]
    }
}
"@

    $FileOutput | Set-Content -Path $FilePath
}