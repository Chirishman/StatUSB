function Connect-StatUSBPort {
    [CmdletBinding()]
    Param()
    if ($Global:SerialConnections) {
        Disconnect-StatUSBPort
    }
   
    $VendorInfo = @{
        VID = '2047'
        PID = '03DF'
    }
    
    $TargetDeviceInfo = ("^USB\\VID_{0}&PID_{1}\\" -f $VendorInfo.VID, $VendorInfo.PID)

    #Get Com Ports
    $AllSerial = [System.IO.Ports.SerialPort]::getportnames() | Select-Object -Unique
    $RemoveNonUSBNonStatUSBSerial = Get-PnpDevice -FriendlyName '* (COM*' -Class 'Ports' | Where-Object {$_.DeviceID -notmatch '^BTHENUM' -and $_.DeviceID -match $TargetDeviceInfo }
    $FriendlyNames = ($RemoveNonUSBNonStatUSBSerial.FriendlyName) -join '|'
    $USBComPorts = $AllSerial | Where-Object {$FriendlyNames -match "\($_\)"}

    [System.IO.Ports.SerialPort[]]$Ports = $USBComPorts | ForEach-Object {
        [System.IO.Ports.SerialPort]::new($_, 9600, 'None', 8, 'one')
    }

    $Global:SerialConnections = (
        $Ports | ForEach-Object {
            try {
                $_.Open()
            } catch {}
            if ($_.IsOpen) {
                $_
            }
        }
    ) | Select-Object @{N = 'PortName'; E = {$_.PortName}}, @{N = 'UUID'; E = {$_.WriteLine('?'); start-sleep -Seconds 2; [void]$_.ReadLine(); $_.ReadExisting()}}, @{N = 'Port'; E = {$_}}
}