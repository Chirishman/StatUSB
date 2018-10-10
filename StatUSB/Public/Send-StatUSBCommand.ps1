function Send-StatUSBCommand {
    Param(
        [Parameter(Mandatory)]
        [string]$Command,
        [Parameter(Mandatory)]
        [string]$TargetID
    )

    $global:SerialConnections | ? {$_.UUID -eq $TargetID} | % {
        $_.Port.WriteLine($Command)
		$_.Port.BaseStream.Flush()
		$_.Port.DiscardInBuffer()
		$_.Port.DiscardOutBuffer()
		[void]$_.Port.ReadExisting()
    }
}