# directory containing this script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjDir  = Join-Path -Path $ScriptDir -ChildPath "TabControl\"
$ProjFile  = Join-Path -Path $ScriptDir -ChildPath "TabControl\TabControl.NET4.csproj"

# download latest nuget.exe
$nugeturl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$nugetexe = "$($env:temp)\nuget.exe"
$client = new-object System.Net.WebClient
$client.DownloadFile($nugeturl, $nugetexe)

# create the nuspec file for the "Release" build
Invoke-Expression "$($nugetexe) Pack '$($ProjFile)' -OutputDirectory '$($ProjDir)' -Properties Configuration=Release"

# directory containing this script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjDir  = Join-Path -Path $ScriptDir -ChildPath "TabControl.NET6\"
$ProjFile  = Join-Path -Path $ScriptDir -ChildPath "TabControl.NET6\TabControl.NET6.csproj"

# download latest nuget.exe
$nugeturl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$nugetexe = "$($env:temp)\nuget.exe"
$client = new-object System.Net.WebClient
$client.DownloadFile($nugeturl, $nugetexe)

# create the nuspec file for the "Release" build
Invoke-Expression "$($nugetexe) Pack '$($ProjFile)' -OutputDirectory '$($ProjDir)' -Properties Configuration=Release"
