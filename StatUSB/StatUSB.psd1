# Module manifest for module 'StatUSB'
# Generated by: Chirishman
# Generated on: 9/26/2018 2:25:15 PM

@{
    # Script module or binary module file associated with this manifest.
    RootModule        = 'StatUSB.psm1'

    # Version number of this module.
    ModuleVersion     = '1.1'

    # ID used to uniquely identify this module
    GUID              = '96a7d855-b702-4d0a-a4a7-1ae8452183fd'

    # Author of this module
    Author            = 'Chirishman'

    # Company or vendor of this module
    #CompanyName = ''

    # Copyright statement for this module
    # Copyright = '(c) 2018 Chirishman. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'A toolkit for interacting with Fit-StatUSB RGB USB devices'

    # Minimum version of the Windows PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = @(
        'Connect-StatUSBPort',
        'Disconnect-StatUSBPort',
        'New-StatUSBCommand',
        'Send-StatUSBCommand'
    )

    # Cmdlets to export from this module
    #CmdletsToExport = '*'

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module
    #AliasesToExport = '*'

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess
    # PrivateData = ''

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}