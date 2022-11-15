# Roku

Emitir comandos de Protocolo de control externo (ECP) para manipular televisores de forma remota y cómo diseñar scripts personalizados para automatizar el juego con sus amigos!


Enumeración de su red para dispositivos Roku:
Utilizando Nmap, podemos emitir el siguiente comando para enumerar nuestra red para dispositivos Roku buscando versiones de servicio (-sV), sistemas operativos (-O) y acelerando el escaneo al no resolver DNS (-n).

$ sudo nmap -sV -O -n 192.168.X.X/24
Salida del escaneo Nmap:

Informe de escaneo de Nmap para 192.168.X.X
El host está activo (latencia de 0,010 s).
No se muestra: 998 puertos filtrados
VERSIÓN DEL SERVICIO DEL ESTADO DEL PUERTO
7000/tcp abierto rtsp AirTunes rtspd
9080/tcp abierto http mangosta httpd
Dirección MAC: 10:59:32:XX:XX:XX (Roku)
Vemos que Nmap identificó el OUI de la dirección MAC, ¡pero proporcioné una lista de direcciones MAC de Roku para buscar en su red!

Direcciones MAC de ROKU

roku, inc. d0:4d:2c
roku, inc. b0:a7:37
roku, inc. b0:ee:7b
roku, inc d8:31:34
roku, inc. 10:59:32
roku, inc a8:b5:7c
roku, inc. b8:a1:75
roku, inc. 88:de:a9
roku, inc. 00:0d:4b
roku, inc 20:ef:bd
roku, inc. 08:05:81
roku, inc. c8:3a:6b
roku, inc 8c:49:62
roku, inc bc: d7: d4
roku, inc. ac:3a:7a
roku, inc. b8:3e:59
roku, inc. corriente continua: 3a: 5e
roku, inc. ac:ae:19
roku, inc. cc:6d:a0
roku, inc 84:ea:ed


Más enumeración


http://192.168.X.X:8060/query/device-info

curl http://192.168.X.X:8060/query/device-info


Esto producirá una página XML similar a la siguiente:
<?xml version="1.0" encoding="UTF-8" ?>
<device-info>
	<udn>280001c0-0000-1000-8000-7c27bc684909</udn>
	<serial-number>X00700C2SMY5</serial-number>
	<device-id>S07E7162SMY5</device-id>
	<advertising-id>0f3c6baa-6016-5fd7-a324-43d55e01965e</advertising-id>
	<vendor-name>Hisense</vendor-name>
	<model-name>4Series-43</model-name>
	<model-number>D206X</model-number>
	<model-region>MX</model-region>
	<is-tv>true</is-tv>
	<is-stick>false</is-stick>
	<screen-size>43</screen-size>
	<panel-id>2</panel-id>
	<mobile-has-live-tv>true</mobile-has-live-tv>
	<ui-resolution>720p</ui-resolution>
	<tuner-type>ATSC</tuner-type>
	<supports-ethernet>false</supports-ethernet>
	<wifi-mac>7c:27:bc:68:49:09</wifi-mac>
	<wifi-driver>realtek</wifi-driver>
	<has-wifi-extender>false</has-wifi-extender>
	<has-wifi-5G-support>true</has-wifi-5G-support>
	<can-use-wifi-extender>true</can-use-wifi-extender>
	<network-type>wifi</network-type>
	<network-name>INFINITUM6669</network-name>
	<friendly-device-name>43&quot; Hisense Roku TV</friendly-device-name>
	<friendly-model-name>Hisense•Roku TV</friendly-model-name>
	<default-device-name>Hisense•Roku TV - X00700C2SMY5</default-device-name>
	<user-device-name>43&quot; Hisense Roku TV</user-device-name>
	<user-device-location>Cuarto de estar</user-device-location>
	<build-number>CPC.50E04235A</build-number>
	<software-version>11.5.0</software-version>
	<software-build>4235</software-build>
	<secure-device>true</secure-device>
	<language>es</language>
	<country>MX</country>
	<locale>es_MX</locale>
	<time-zone-auto>false</time-zone-auto>
	<time-zone>Mexico/Central</time-zone>
	<time-zone-name>México/Central</time-zone-name>
	<time-zone-tz>America/Bahia_Banderas</time-zone-tz>
	<time-zone-offset>-360</time-zone-offset>
	<clock-format>12-hour</clock-format>
	<uptime>786630</uptime>
	<power-mode>PowerOn</power-mode>
	<supports-suspend>true</supports-suspend>
	<supports-find-remote>false</supports-find-remote>
	<supports-audio-guide>false</supports-audio-guide>
	<supports-rva>true</supports-rva>
	<has-hands-free-voice-remote>false</has-hands-free-voice-remote>
	<developer-enabled>true</developer-enabled>
	<keyed-developer-id/>
	<search-enabled>true</search-enabled>
	<search-channels-enabled>true</search-channels-enabled>
	<voice-search-enabled>true</voice-search-enabled>
	<notifications-enabled>false</notifications-enabled>
	<notifications-first-use>true</notifications-first-use>
	<supports-private-listening>true</supports-private-listening>
	<supports-private-listening-dtv>true</supports-private-listening-dtv>
	<supports-warm-standby>true</supports-warm-standby>
	<headphones-connected>false</headphones-connected>
	<supports-audio-settings>false</supports-audio-settings>
	<supports-ecs-textedit>true</supports-ecs-textedit>
	<supports-ecs-microphone>true</supports-ecs-microphone>
	<supports-wake-on-wlan>true</supports-wake-on-wlan>
	<supports-airplay>true</supports-airplay>
	<has-play-on-roku>true</has-play-on-roku>
	<has-mobile-screensaver>false</has-mobile-screensaver>
	<support-url>http://www.hisense.com.mx/support/</support-url>
	<grandcentral-version>8.2.38</grandcentral-version>
	<av-sync-calibration-enabled>3.0</av-sync-calibration-enabled>
</device-info>



Emisión de comandos


Existen numerosos comandos que se pueden emitir a través de solicitudes HTTP, por lo que proporcioné la tabla de ECP potenciales que se pueden enviar al dispositivo:


  Home
  
  Rev
  
  Fwd
  Play
  Select
  Left
  Right
  Down
  Up
  Back
  InstantReplay
  Info
  Backspace
  Search
  Enter
  
  
  VolumeDown
  VolumeMute
  VolumeUp
  PowerOff
  
  
  ChannelUp
  ChannelDown
  
  
  InputTuner
  InputHDMI1
  InputHDMI2
  InputHDMI3
  InputHDMI4
  InputAV1


Espero que hayas aprendido algo nuevo, y si necesitas más información y recursos sobre cómo divertirte más con estos dispositivos, consulta
https://developer.roku.com/es-mx/docs/developer-program/debugging/external-control-api.md

Happy hunting!
