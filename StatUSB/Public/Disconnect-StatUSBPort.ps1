function Disconnect-StatUSBPort {
    Param()
    $Global:SerialConnections | ForEach-Object {$_.Port.Close()}
}