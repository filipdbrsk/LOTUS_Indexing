#! /bin/bash
while read -r downloadLink; do
        echo $downloadLink
        curl -q -o - $downloadLink | zcat | grep '"' | nodejs --max-old-space-size=8192 literals_in_es.js
        echo "done"
done < <( ./Frank/frank documents --downloadUri )