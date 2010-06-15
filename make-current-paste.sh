#!/bin/bash

WER=/l/s/WER
echo "Path to the WER directory in apertium-sme-nob: ${WER}";

PASTES=$(dirname $0)

cd ${WER} && make -j2 && ./make-paste.sh > ${PASTES}/current-paste && cd ${PASTES} && GIT_PAGER='' git diff && echo "Now do:" && echo "sh ${PASTES}/update-wdiff-with-earlier.sh"
