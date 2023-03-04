$documentid = 1

do {
    $url = "http://fridayharbor.org/imagerepository/document?documentid=$documentid"
    $response = Invoke-WebRequest -Uri $url
    $extension = $response.Headers["Content-Type"].Split("/")[-1]
    $filename = "document_$documentid.$extension"
    Invoke-WebRequest -Uri $url -OutFile $filename
    $documentid++
} while ($true)