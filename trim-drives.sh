for i in {a..l}
do

	nohup cat /root/sector-ranges | hdparm --please-destroy-my-drive --trim-sector-ranges-stdin /dev/sd${i} &
done
