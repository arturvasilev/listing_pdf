#!/bin/bash

if [ -d $1 ]
then
  echo "Сканирование директории " $1
else
  echo "Введите имя каталога для сканирования"
  exit
fi

list=$(mktemp)

find $1 -name *.cpp > $list
find $1 -name *.hpp >> $list
find $1 -name *.c >> $list
find $1 -name *.h >> $list

listing=$(mktemp)

# echo "\\begin{verbatim}" > $listing

for i in $(cat $list)
do
  echo -e '\n\nФайл' $i >> $listing
  # cat -n $i | fold -w 80 | sed 's/\t/  /'
  cat $i | fold -w 80 | sed 's/\t/  /' >> $listing
done

# echo "\\end{verbatim}" >> $listing

rm -f $list

main=$(mktemp)

cat main.tex > $main

echo >> $main
echo "\\begin{verbatim}" >> $main

cat $listing >> $main
# echo "\\input{$listing}" >> $main
echo >> $main

echo "\\end{verbatim}" >> $main
echo "\\end{document}" >> $main
echo >> $main

pdflatex $main -halt-on-error
cp $listing listing.txt

rm tmp.aux tmp.log
mv tmp.pdf main.pdf

rm -f $main $listing
