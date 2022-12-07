try {
    Get-ChildItem E:\Windows\minidump\
}
catch [System.IO.DirectoryNotFoundException] {
    Write-Host "Verzeichnis nicht gefunden"
    Create-Item E:\Windows\minidump\
}

catch [System.IO.FileNotFoundException] {
    Write-Host "Datei nicht gefunden"
    Create-Item E:\Windows\minidump\minidump.dmp
}
catch [System.IO.IOException] {
    Write-Host "IO Fehler"
}
catch [System.AccessViolationException]{
    Write-Host "Zugriffsverletzung"
}
catch {
        Write-Host "Fehler: $($_.Exception.GetType())"
}