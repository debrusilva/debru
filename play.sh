import os
from scrapradio2 import ScrapRadio as sc

radio1 =['http://5.196.227.245:8006','Gothic Radio',17,19,'td','class','streamstats','http://5.196.227.245:8006/128mp3']

sc.getDadosRadio(radio1)

linkR =sc.link

print(linkR)

#os.system('mplayer -ao alsa'+link)



