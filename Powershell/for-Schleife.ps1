for ($i = 1 ; $i -le 100 ; $i++) {
    Write-Host($i)
    Write-Output($i * ($i + 1) / 2 ) >> C:\Users\germa\test.txt
}
