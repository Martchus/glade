pushd
function not ($cm, $pm) {
  if (& $cm $pm) {0} else {1}
}

$pf = ${env:programfiles(x86)}
$wd = ${env:windir}
$vu = "$pf/microsoft visual studio 12.0"
$mc = "$wd/microsoft.net"
# convert-path is only for existing paths
$vr = join-path $env:appdata velour
$env:path = "$pf/microsoft sdks/windows/v8.0a/bin/netfx 4.0 tools",
  "$wd/system32" -join ';'

# variables
[environment]::setenvironmentvariable('VS120COMNTOOLS',
  "$vu/common7/tools/", 'm')

# keys visualstudio
ni -f hklm:/software/wow6432node/microsoft/visualstudio
cd hklm:/software/wow6432node/microsoft/visualstudio
ni -f 12.0/setup/vc
sp 12.0/setup/vc productdir $vu/vc/
ni -f sxs/vc7
sp sxs/vc7 12.0 $vu/vc/
sp sxs/vc7 frameworkver32 'v4.0.30319'
sp sxs/vc7 frameworkver64 'v4.0.30319'
sp sxs/vc7 frameworkdir32 $mc/framework/
sp sxs/vc7 frameworkdir64 $mc/framework64/
ni -f sxs/vs7
sp sxs/vs7 12.0 $vu/

# keys msbuild
ni -f hklm:/software/wow6432node/microsoft/msbuild/toolsversions/12.0
cd hklm:/software/wow6432node/microsoft/msbuild/toolsversions
sp 12.0 vctargetspath $pf/msbuild/microsoft.cpp/v4.0/v120/
sp 12.0 msbuildtoolspath $pf/msbuild/12.0/bin/
sp 12.0 msbuildframeworktoolspath "$mc/framework/v4.0.30319/"

# keys microsoft sdks
ni -f 'hklm:/software/wow6432node/microsoft/microsoft sdks/windows/v7.1a'
cd 'hklm:/software/wow6432node/microsoft/microsoft sdks/windows'
sp v7.1a installationfolder "$pf/microsoft sdks/windows/v7.1a/"

# packages
$pk = @{
  'vc_compilercore86'            = 'kb2829760.msp'
  'buildtools_msbuild_x86'       = $false
  'buildtools_msbuildresmsi_x86' = $false
  'sdk_tools4'                   = $false
  'vc_compilercore86res'         = $false
  'vc_librarycore86'             = $false
  'vc_librarydesktop'            = $false
  'vcruntimeminimum_x86'         = $false
  'xpsupport'                    = $false
}
cd $psscriptroot/packages
if (not test-path $vr) {
  $pk.getenumerator() | % {
    $ue = ls -r $_.value | % {"patch=$_"}
    ls -r $_.key *.msi | % {
      msiexec -a $_.fullname targetdir=$vr $ue | oh
    }
  }
}

# program files
cd "$vr/program files"
'microsoft sdks',
'microsoft visual studio 12.0',
'msbuild' | % {
  if (not test-path $pf/$_) {
    mv $_ $pf
  }
}

# system
cd $vr/system
ls | % {
  if (not test-path $wd/system/$_) {
    mv $_ $wd/system
  }
}

# gacutil
cd $vu/common7/ide/fromgac
gacutil -i system.threading.tasks.dataflow.dll
popd
