function Send-StatUSBCommand {
    Param(
        [Parameter(Mandatory)]
        [string]$Command,
        [Parameter()]
        [string]$TargetID
    )

    $global:SerialConnections | Where-Object {if ($TargetID) {$_.UUID -eq $TargetID}else {$true}} | ForEach-Object {
        $_.Port.WriteLine($Command)
        $_.Port.BaseStream.Flush()
        $_.Port.DiscardInBuffer()
        $_.Port.DiscardOutBuffer()
        [void]$_.Port.ReadExisting()
    }
}