#!/bin/bash

OUTPUT=/path/to/link_report.txt

echo "------------------------------------------------" > $OUTPUT
echo $(date) >> $OUTPUT
echo "------------------------------------------------" >> $OUTPUT

while read line
do
  echo "" >> $OUTPUT
  echo "$line" >> $OUTPUT
  out=$(
     curl -A "Mozilla/5.0" -I \
        $line | head -n 1 | cut -d$' ' -f2
  )
  echo $out >> $OUTPUT
  
done < "data/links.txt"
