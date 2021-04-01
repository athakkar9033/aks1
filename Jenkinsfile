pipeline{
    agent any
    stages{
        stage('Powershel create folder'){
            steps{
                echo "Hello World"
                powershell label: '', script: 'Write-Host "Hello World, I\'m a Jenkins build!"'
                powershell script: 'mkdir "D:\\testjenkins" -ErrorAction SilentlyContinue; mkdir "D:\\secondfolder" -ErrorAction SilentlyContinue'
            }
        }
        stage('powershell create files'){
            steps{
                powershell script: 
                    '''
                       New-Item -Path "D:\\scriptblock1"  -ErrorAction SilentlyContinue; 
                       mkdir "D:\\scriptblocktest"  -ErrorAction SilentlyContinue;
                       $ipAddress = (Get-NetIPConfiguration | Where-Object {$_.IPv4DefaultGateway -ne $null -and $_.NetAdapter.status -ne "Disconnected"}).IPv4Address.IPAddress;
                       write-host "Your pc ip is" ; $ipAddress;
                       
                       '''
                   
                }
            }
        }
    }
