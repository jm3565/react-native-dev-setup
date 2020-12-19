$ANDROID_HOME = [System.Environment]::GetEnvironmentVariable('ANDROID_HOME', [System.EnvironmentVariableTarget]::User)

if ($ANDROID_HOME) {
    $currentPATH = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::User)
    $newPath = $currentPATH

    # platform-tools
    $plat_tools_path = "$ANDROID_HOME\platform-tools"
    # other tools (avdmanager, sdkmanager, etc)
    $tools_path = "$ANDROID_HOME\tools\bin"
    # emulator (emulator)
    $emulator_path = "$ANDROID_HOME\emulator"

    $path1 = $false
    $path2 = $false
    $path3 = $false

    "$currentPATH".Split(";") | ForEach-Object {
        switch ($_) {
            $plat_tools_path { 
                $path1 = $true
            }
            $tools_path {
                $path2 = $true
            }
            $emulator_path {
                $path3 = $true
            }
            Default {}
        }
    }

    if (!$path1) {
        $newPath = $newPath + ";$plat_tools_path"
    }
    if (!$path2) {
        $newPath = $newPath + ";$tools_path"
    }
    if (!$path3) {
        $newPath = $newPath + ";$emulator_path"
    }

    if (!$path1 -or !$path2 -or !$path3) {
        [System.Environment]::SetEnvironmentVariable("PATH", $newPath, [System.EnvironmentVariableTarget]::User)
    }
    else {
        Write-Host "All tools have already been added"
    }
}
else {
    Write-Host "ANDROID_HOME path does not exist"
}


