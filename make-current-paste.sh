#!/bin/bash

WER=/l/s/WER
echo "Path to the WER directory in apertium-sme-nob: ${WER}";


PASTES=$(cd $(dirname $0) && pwd)


cd ${WER} 
make -j2 && sh make-paste.sh > ${PASTES}/current-paste
if [ $? -eq 0 ]; then
    cd ${PASTES}
    GIT_PAGER='' git diff --color-words current-paste
    echo "Now do:"
    echo "sh ${PASTES}/update-wdiff-with-earlier.sh"
fi
