$documentid = 1
$timestamp = [int][double]::Parse((Get-Date -UFormat %s))
$foldername = "Documents_$timestamp"
New-Item -ItemType Directory -Force -Path $foldername

do {
    $url = "http://fridayharbor.org/imagerepository/document?documentid=$documentid"
    try {
        $response = Invoke-WebRequest -Uri $url
        $extension = $response.Headers["Content-Type"].Split("/")[-1]
        $filename = "document_$documentid.$extension"
        $filepath = Join-Path $foldername $filename
        Invoke-WebRequest -Uri $url -OutFile $filepath
        Write-Host "File found for $documentid "
        $documentid++
    }
    catch {
        Write-Host -ForegroundColor Red "No file found for documentid $documentid"
        $documentid++
    }
} while ($true)
