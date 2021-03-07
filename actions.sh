#!/bin/bash
mkdir -p 02
# for i in $(seq 1 85); do
#  ./Inkscape-e86c870-x86_64.AppImage --export-type="svg" --pdf-page=$i \
#    --pdf-poppler --export-filename=02/02_`printf %03d $i`.svg 02.pdf
#done
#lines=(`grep -iRn "bAEMACAYGBwYFCAcHBwkJCAoMFA0MCwsMGRITDxQdGh8eHRocHCAkLicgIiwjHBwoNyksMDE0NDQ" 02/ | cut -d : -f 1,2`)
#for desc in ${lines[*]}
#do
#  file=`echo $desc | cut -d : -f 1`
#  number=`echo $desc | cut -d : -f 2`
#  sed "$(($number-3))!d" $file | cut -d \" -f 2
#done

imagefragment="bAEMACAYGBwYFCAcHBwkJCAoMFA0MCwsMGRITDx"
imagefragment+="QdGh8eHRocHCAkLicgIiwjHBwoNyksMDE0NDQ"

#xmllint --xpath "/*[local-name() = 'svg']/*[local-name() 'defs']/*g" 02/02_001.svg | head -n 20
#xpath="/svg/defs/image/@*[name()='xlink:href'][contains(.,'$imagefragment')]"
xpath="/svg/defs/image"
xmlstarlet ed -N svg='http://www.w3.org/2000/svg' -d $xpath 04/02_001.svg

# xmllint --xpath "/$ns:svg/$ns:defs/g" "02/02_001.svg"
