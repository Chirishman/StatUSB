# StatUSB
Module for interacting with Fit-StatUSB devices

## Usage Examples

### Single Color Command

```PowerShell
Connect-StatUSBPort

$Command = New-StatUSBCommand -Color orange

Send-StatUSBCommand -Command $Command
```

### Color Pattern with Custom Transition Durations
```PowerShell
Connect-StatUSBPort

$Command = New-StatUSBCommand -Color orange,blue -TransitionTime 0:0:10,0:1:0

Send-StatUSBCommand -Command $Command
```