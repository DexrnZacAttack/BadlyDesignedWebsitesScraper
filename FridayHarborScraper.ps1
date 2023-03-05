$documentid = 1

do {
    $url = "http://fridayharbor.org/imagerepository/document?documentid=$documentid"
    try {
        $response = Invoke-WebRequest -Uri $url
        $extension = $response.Headers["Content-Type"].Split("/")[-1]
        $filename = "document_$documentid.$extension"
        Invoke-WebRequest -Uri $url -OutFile $filename
        Write-Host "File found for $documentid "
        $documentid++
    }
    catch {
        Write-Host -ForegroundColor Red "No file found for documentid $documentid"
        $documentid++
    }
} while ($true)
