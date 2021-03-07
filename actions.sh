#!/bin/bash
rm -rf 05
mkdir -p 05/{original,wmremoved}
imagefragment="bAEMACAYGBwYFCAcHBwkJCAoMFA0MCwsMGRITDx"
imagefragment+="QdGh8eHRocHCAkLicgIiwjHBwoNyksMDE0NDQ"
for i in $(seq 1 85); do
  curfilename=05/original/02_`printf %03d $i`.svg
  curfilename_new=05/wmremoved/02_`printf %03d $i`.svg
  xpath="//ns:image[contains(@xlink:href,'$imagefragment')]"
  (./Inkscape-e86c870-x86_64.AppImage --export-type="svg" --pdf-page=$i \
    --pdf-poppler --export-filename=$curfilename 03.pdf; \
    xmlstarlet ed -N ns=http://www.w3.org/2000/svg -d "$xpath" $curfilename > $curfilename_new; \
    ./Inkscape-e86c870-x86_64.AppImage --export-type="pdf" --export-filename=$curfilename_new.pdf $curfilename_new) &
done
