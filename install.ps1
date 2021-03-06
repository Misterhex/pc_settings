# install modules
& {
    $color = [ConsoleColor]::Green
    # install PsGet
    Write-Host "installing PsGet" -ForegroundColor $color
    (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

    # posh-git
    Install-Module Posh-Git

    # psake
    Write-Host "installing psake" -ForegroundColor $color
    Install-Module psake

    # psurl
    Write-Host "installing psurl" -ForegroundColor $color
    Install-Module PsUrl
}

# run tasks

& {
    Write-Host "invoking psake tasks" -ForegroundColor Yellow
    Invoke-psake ./default.ps1
}

& {
    $color = [ConsoleColor]::Green
    Write-Host "Installing successful. Reload your profile to take effects." -ForegroundColor $color
    Write-Host ". $HOME/Documents/WindowsPowershell/profile.ps1"
}
