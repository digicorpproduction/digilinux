# Stop the MoveIT Automation Web Admin service
Stop-Service -Name "MoveITAutomationWebAdmin" -Force

# Wait for the service to stop (adjust sleep duration as needed)
Start-Sleep -Seconds 10

# Set the path to the Tomcat bin directory
$tomcatBinPath = "D:\Program Files\MOVEit Automation Web Admin\Tomcat\bin"

# Run the tomcat.bat file
Start-Process -FilePath "$tomcatBinPath\tomcat.bat" -Wait

# Set Java initial and maximum memory pool
$javaConfigPath = "$tomcatBinPath\tomcatw.exe.config"
$javaConfig = Get-Content -Path $javaConfigPath

# Update Java configuration
$javaConfig = $javaConfig -replace 'Initial memory pool:.*', 'Initial memory pool: 1024M'
$javaConfig = $javaConfig -replace 'Maximum memory pool:.*', 'Maximum memory pool: 2048M'

# Apply the changes
$javaConfig | Set-Content -Path $javaConfigPath

# Start the MoveIT Automation Web Admin service
Start-Service -Name "MoveITAutomationWebAdmin"