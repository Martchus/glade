function Link-Item ($so, $de) {
  $df = Convert-Path $de
  Push-Location $so
  Get-ChildItem -Recurse -File | % {
    Resolve-Path -Relative $_.Directory | % {
      New-Item -Force -ItemType directory $df\$_
    }
    Resolve-Path -Relative $_.FullName | % {
      fsutil hardlink create $df\$_ $_
    }
  }
  Pop-Location
}
Link-Item foo bar
