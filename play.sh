#!/bin/bash
LOGFILE=/home/debru/scripts/radiodumdum.log;
CHANNELFILE=/home/debru/radiochannels.txt
case "$1" in
restart|start)

if [ `ps auxwwww|grep mplayer|wc -l` -gt 0 ]
then
killall mplayer 2> /dev/null
for pid in `ps auxwww|grep mplayer|tr -s ' '|cut -d ' ' -f2`
do
kill -9 $d 2> /dev/null
done

fi

#mplayer mms://212.72.165.19/radiodumdum/ > /dev/null 2>&1 &
mplayer -ao alsa http://stream.getmyip.com  >> $LOGFILE 2>&1 &
tail -f $LOGFILE
;;

stop)
if [ `ps auxwwww|grep mplayer|wc -l` -gt 0 ]
then
killall mplayer 2> /dev/null
for pid in `ps auxwww|grep mplayer|tr -s ' '|cut -d ' ' -f2`
do
kill -9 $d 2> /dev/null
done
fi
;;
list)
echo "Choose your interest"
select mychannel in `cat $CHANNELFILE|cut -d ',' -f1`
do
if [ $mychannel ]
then
mymmsurl=`cat $CHANNELFILE|grep -w $mychannel|cut -d ',' -f2`;
playlistoption=`cat $CHANNELFILE|grep -w $mychannel|cut -d ',' -f3`;
if [ $mymmsurl ]
then
radio stop
mplayer -ao alsa $playlistoption $mymmsurl >> $LOGFILE 2>&1 &
break;
fi
echo "No mms URL found; continuing.. Please check file: $CHANNELFILE";
break;
else
echo "Wrong choice. exiting.."
break;
fi

done
;;
-s)
mychannel=$2
$0 stop
mymmsurl=`cat $CHANNELFILE|grep -i $mychannel|cut -d ',' -f2|head -n1`;
playlistoption=`cat $CHANNELFILE|grep -i $mychannel|cut -d ',' -f3`;
mplayer -ao alsa $playlistoption $mymmsurl >> $LOGFILE 2>&1 &
;;

status)
if [ `ps auxwwww|grep mplayer|wc -l` -gt 0 ]
then
tail -f -n 1 $LOGFILE
else
echo "radio dumdum: stopped"
fi
;;
*)
echo "Usage: $0 list|start|stop|restart"
esac

