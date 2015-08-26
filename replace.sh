#/bin/sh

COMMAND=`basename $0`

if [ $# -ne 2 ] ; then
    echo "usage ${COMMAND} [before] [after]"
    exit;
fi

BEFORE=$1
AFTER=$2

for file in `find ./ -type f | xargs grep ${BEFORE} | grep -v ${COMMAND} | awk -F: '{print $1}' | sort | uniq`
do
  echo "replacing $file before:$BEFORE afiter:$AFTER"
  cp $file $file"_tmp"
  sed -e "s/${BEFORE}/${AFTER}/" $file"_tmp" > $file
  rm $file"_tmp"
done
