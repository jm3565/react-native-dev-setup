$ANDROID_HOME='ANDROID_HOME'
$ah_path=[System.Environment]::GetEnvironmentVariable($ANDROID_HOME, [System.EnvironmentVariableTarget]::User)

if(!$ah_path){
    $path_to_set=$env:LOCALAPPDATA + '\Android\Sdk'

    $shouldSet = Read-Host "Path for ANDROID_HOME environment variable will be set to '$path_to_set' - is this correct? [Y]es | [N]o (Enter)"

    if($shouldSet -ieq 'Y'){
        [System.Environment]::SetEnvironmentVariable($ANDROID_HOME, $path_to_set, [System.EnvironmentVariableTarget]::User)
    }else{
        Write-Host "Environment variable was not set!"
    }
}else{
    Write-Host "$ANDROID_HOME path is already set at '$ah_path'"
}