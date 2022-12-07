$Path = "C:\Windows\Temp\while.txt"

if (Test-Path $Path) {
    Remove-Item $Path -ErrorAction SilentlyContinue
}

New-Item -Path $Path -ItemType File -Force
while ((Get-ChildItem -Path $Path).Length -lt 2KB) {
    (60..122) | Get-Random | %{[char]$_} | Out-File -FilePath $Path -Append -NoNewline
}