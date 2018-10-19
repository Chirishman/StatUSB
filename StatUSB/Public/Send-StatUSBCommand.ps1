function Send-StatUSBCommand {
    Param(
        [Parameter(Mandatory)]
        [string]$Command,
        [Parameter()]
        [string]$TargetID
    )

    $global:SerialConnections | ? {if($TargetID){$_.UUID -eq $TargetID}else{$true}} | % {
        $_.Port.WriteLine($Command)
		$_.Port.BaseStream.Flush()
		$_.Port.DiscardInBuffer()
		$_.Port.DiscardOutBuffer()
		[void]$_.Port.ReadExisting()
    }
}