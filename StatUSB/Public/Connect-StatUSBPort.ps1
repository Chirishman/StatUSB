function Connect-StatUSBPort {
    [CmdletBinding()]
	Param()
    if ($Global:SerialConnections) {
        Disconnect-NotifierPorts
    }

    #Get Com Ports
    $AllSerial = [System.IO.Ports.SerialPort]::getportnames() | select -Unique
    $RemoveNonUSBSerial = Get-PnpDevice -FriendlyName '* (COM*' -Class 'Ports' | ? {$_.DeviceID -notmatch '^BTHENUM'}
    $FriendlyNames = ($RemoveNonUSBSerial.FriendlyName) -join '|'
    $USBComPorts = $AllSerial | ? {$FriendlyNames -match "\($_\)"}

    [System.IO.Ports.SerialPort[]]$Ports = $USBComPorts | % {
        [System.IO.Ports.SerialPort]::new($_, 9600, 'None', 8, 'one')
    }

    $Global:SerialConnections = (
		$Ports | % {
			try {
				$_.Open()
			} catch {}
			if ($_.IsOpen){
				$_
			}
		}
	) | Select @{N = 'PortName'; E = {$_.PortName}}, @{N = 'UUID'; E = {<#$_.WriteLine('?'); start-sleep -Seconds 2; [void]$_.ReadLine(); $_.ReadExisting()#>}}, @{N = 'Port'; E = {$_}}
}