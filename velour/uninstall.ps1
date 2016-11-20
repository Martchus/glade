pushd
$pf = ${env:programfiles(x86)}
$env:path = "$pf/microsoft sdks/windows/v8.0a/bin/netfx 4.0 tools"

# variables
[environment]::setenvironmentvariable('VS120COMNTOOLS', $null, 'm')

# keys
cd hklm:/software/wow6432node/microsoft
'microsoft sdks',
'msbuild',
'visualstudio' | % {
  if (test-path $_) {
    rm -r $_
  }
}

# gacutil
if (test-path $env:path) {
  gacutil -u system.threading.tasks.dataflow
}

# velour
cd $env:appdata
if (test-path velour) {rm -r velour}

# program files
cd $pf
'microsoft sdks',
'microsoft visual studio 12.0',
'msbuild' | % {
  $_
  if (test-path $_) {
    rm -r -fo $_
  }
}

# system
cd $env:windir/system
rm *
popd
