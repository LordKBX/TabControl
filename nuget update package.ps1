Param(
     [Parameter(Mandatory=$true, HelpMessage="NuGet API Key")][String]$apikey
   )

# directory containing this script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjDir  = Join-Path -Path $ScriptDir -ChildPath "TabControl\"
$ProjFile  = Join-Path -Path $ScriptDir -ChildPath "TabControl\TabControl.NET4.csproj"
$PackFile = Join-Path -Path $ScriptDir -ChildPath "TabControl\*.nupkg"

# download latest nuget.exe
$nugeturl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$nugetexe = "$($env:temp)\nuget.exe"
$client = new-object System.Net.WebClient
$client.DownloadFile($nugeturl, $nugetexe)

# create the nuspec file for the "Release" build
Invoke-Expression "$($nugetexe) Pack '$($ProjFile)' -OutputDirectory '$($ProjDir)' -Properties Configuration=Release"
Invoke-Expression "$($nugetexe) Push '$($PackFile)' -Source https://www.nuget.org -ApiKey $($apikey) -Verbosity Detailed"
Remove-Item "$($PackFile)"

# directory containing this script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjDir  = Join-Path -Path $ScriptDir -ChildPath "TabControl.NET6\"
$ProjFile  = Join-Path -Path $ScriptDir -ChildPath "TabControl.NET6\TabControl.NET6.csproj"
$PackFile = Join-Path -Path $ScriptDir -ChildPath "TabControl.NET6\*.nupkg"

# download latest nuget.exe
$nugeturl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$nugetexe = "$($env:temp)\nuget.exe"
$client = new-object System.Net.WebClient
$client.DownloadFile($nugeturl, $nugetexe)

# create the nuspec file for the "Release" build
Invoke-Expression "$($nugetexe) Pack '$($ProjFile)' -OutputDirectory '$($ProjDir)' -Properties Configuration=Release"
Invoke-Expression "$($nugetexe) Push '$($PackFile)' -Source https://www.nuget.org -ApiKey $($apikey) -Verbosity Detailed"
Remove-Item "$($PackFile)"
