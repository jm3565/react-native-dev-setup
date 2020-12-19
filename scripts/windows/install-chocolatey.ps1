$version = choco -v

if(!$version)
{
    try
    {
        Write-Host "Installing Chocolatey"
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 
        $version = choco -v
        Write-Host "Chocolatey version ($version) has been installed"
    }
    catch
    {
        Write-Host $_
    }
}
else 
{
    Write-Host "Chocolatey version ($version) is already installed"
}