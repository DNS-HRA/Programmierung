<# Format GeräteID:
Gerätetyp (2 oder 3 Buchstaben) + Nummer des Gerätes (2 Zeichen) + Userkürzel (3 Zeichen)
#>
$GeräteID = Read-Host "Bitte geben sie eine GeräteID ein "
$regex = "^[a-zA-Z]{2,3}([0-9]{1}[1-9]{1}|[1-9]{1}[0-9]{1})[a-zA-Z]{3}$"

if ($GeräteID -match $regex) {
    Write-Host "$GeräteID ist gültig"
} else {
    Write-Host "$GeräteID ist ungültig"
}

