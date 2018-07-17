from bs4 import BeautifulSoup as bs
import requests as r
import os
import time
from termcolor import colored

class ScrapRadio():

        
    # radio1 =['http://5.196.227.245:8006','Gothic Radio',17,19,'td','class','streamstats','http://5.196.227.245:8006/128mp3']
    # radio2 =['http://janus.cdnstream.com:5200','Sanctuary Radio - Retro Channel',13,15,'td','class','streamstats','']
     # link=''

 
      @staticmethod
      def getDadosRadio(radio):
          global link
          req = r.get(radio[0])
          soup = bs(req.text,'html.parser')
          radio_html = soup.findAll(radio[4],{radio[5]:radio[6]})

          nomeRadio  = radio[1]
          nomeEstilo = radio_html[radio[2]].text
          nomeMusica = radio_html[radio[3]].text
          link  = radio[7]
          print(link) 
	# print ('|-------------------------------------------------------|')
        # print ('| Nome Radio:'+nomeRadio)
        # print ('| Estilo:'+nomeEstilo)
        # print ('| Banda/Musica:'+nomeMusica)
        # print('|-------------------------------------------------------|')
          return radio




          while True:
                os.system('clear')
                getDadosRadio(radio1)
                time.sleep(10)
 
