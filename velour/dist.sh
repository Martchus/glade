vr=$(git log --oneline | wc -l)
pk=$(awk '/ #/ {print "packages/" $2}' FS="'" velour-in.ps1)
zip -9r velour-$vr.zip $pk velour-in.ps1 velour-unin.ps1 README.md
