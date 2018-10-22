function New-StatUSBCommand {
    Param(
        [Parameter(Mandatory)]
        [System.Drawing.Color[]]$Color,
        [Parameter()]
        [timespan[]]$TransitionTime
    )
    $CommandString = [system.collections.arraylist]::new()
    if ($Color.Count -ne 1) {
        [void]$CommandString.Add('B')
        $Transitions = $(
            if ($TransitionTime.Count -ne 1) {
                if ($Color.Count -eq $TransitionTime.Count) {
                    $TransitionTime | ForEach-Object {$_.TotalMilliseconds}
                } else {
                    throw "Color and Transition Counts Don't Match"
                }
            } else {
                0..($Color.Count - 1) | ForEach-Object { $TransitionTime.TotalMilliseconds }
            }
        )
    }

    0..($Color.Count - 1) | ForEach-Object {
        [void]$CommandString.Add(('#{0:X2}{1:X2}{2:X2}' -f $Color[$_].R, $Color[$_].G, $Color[$_].B))
        if ($Transitions) {
            [void]$CommandString.Add(('-{0}' -f $Transitions[$_]))
        }
    }
    -join $CommandString
}