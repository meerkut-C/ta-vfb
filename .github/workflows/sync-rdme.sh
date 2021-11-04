#!/bin/sh

FN_log='.generated.log'
: > "${FN_log}"
exec 5<> "${FN_log}"
echo 'sync-rdme.sh starting...' >&5
echo -n 'pwd=' >&5 ; pwd >&5

FNa='README.md'
FNb='LICENSE'
DIR='mark-viewport'

DIROK=$(find . -maxdepth 1 -type d -name "${DIR}" | wc -l)
if [ x"${DIROK}" = x"1" ]
then
  $(cmp -s "${FNa}" "${DIR}"/"${FNa}"  &&  cmp -s "${FNb}" "${DIR}"/"${FNb}")
  if [ $? -eq 0 ]
  then
    echo 'no extra commit, files match' >&5
  else
    cp "${FNa}" "${FNb}" ./mark-viewport/             >&5
    git config user.name meerkut-C                    >&5
    git add .                                         >&5
    git commit -m "an extra commit from sync-rdme.sh" >&5
    git push                                          >&5
    echo '+ extra commit produced'                    >&5
  fi
else
  echo 'there will be no additional commit' >&5
fi
echo '  done.'  >&5