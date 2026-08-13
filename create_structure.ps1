# Script de creation de la structure MedCoach (backend + frontend)
# A executer depuis la racine du repo : C:\Users\ASUS\Desktop\MedCoach_docs

$folders = @(
    "backend\config",
    "backend\apps\users",
    "backend\apps\documents",
    "backend\apps\rag",
    "backend\apps\assessment",
    "backend\apps\progression",
    "backend\apps\admin_panel",
    "frontend\public",
    "frontend\src\components",
    "frontend\src\pages",
    "frontend\src\services",
    "frontend\src\store",
    "frontend\src\types",
    "frontend\src\hooks"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Path $folder -Force | Out-Null
    New-Item -ItemType File -Path "$folder\.gitkeep" -Force | Out-Null
    Write-Host "Cree : $folder"
}

Write-Host ""
Write-Host "Structure creee avec succes."
Write-Host "Prochaine etape : git add -A puis git commit et git push"