#! /bin/sh
# List ranges for hdparm --trim-sector-ranges-stdin
: ${MAXSECT=65535}
test $# = 2 || { echo "Usage: trimlist sectors offset" >&2; exit 1; }
sectors=$1
pos=$2
while test $sectors -gt 0; do
    if test $sectors -gt $MAXSECT; then
            size=$MAXSECT
    else
            size=$sectors
    fi
    echo $pos:$size
    sectors=$(($sectors-$size))
    pos=$(($pos+$size))
done 
# |  hdparm --please-destroy-my-drive --trim-sector-ranges-stdin /dev/sda
