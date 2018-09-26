function Send-StatUSBCommand {
    Param(
        [Parameter(Mandatory)]
        [string]$Command,
        [Parameter(Mandatory)]
        [string]$TargetID
    )

    $global:SerialConnections | ? {$_.UUID -eq $TargetID} | % {
        $_.Port.WriteLine($Command)
    }
}