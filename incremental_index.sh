#!/bin/bash
[ -z "$1" ] && echo "Pass download link as argument" && exit 1;
downloadLink=$1
docid=${downloadLink##*/}
currentDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
curl -q -o - $downloadLink | zcat | grep '"' | nodejs $currentDir/literals_in_es.js $docid
