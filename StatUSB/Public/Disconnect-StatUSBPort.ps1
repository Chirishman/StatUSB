function Disconnect-StatUSBPort {
    Param()
    $Global:SerialConnections | % {$_.Port.Close()}
}