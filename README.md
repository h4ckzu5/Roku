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


¡Podemos identificar la ubicación del dispositivo, el nombre y varios otros campos pertinentes, como admitir capacidades remotas! Otra forma de enumerar los dispositivos Roku es enviar una solicitud a la dirección de multidifusión del puerto de descubrimiento de servicio simple (SSDP) y al puerto 1900. Podemos hacer esto usando Netcat:


$ nc -u 239.255.255.250 1900 < Roku_ECP_Enum.txt
El dispositivo responderá con esta información que también se puede observar en Wireshark:


HTTP/1.1 200 Aceptar
Control de caché: edad máxima = 3600
ST: roku:ecp
Ubicación: http://192.168.X.X:8060/
USN: uuid:roku:ecp:P0A070000007
Utilizando Nmap y Wireshark, podemos identificar fácilmente la dirección IP de cualquier dispositivo Roku conectado a la red y, si admiten el uso de ECP, ¡podemos ver de forma remota el archivo XML en el servidor web del dispositivo!


http://192.168.X.X:8060/query/device-info
Esto producirá una página XML similar a la siguiente:


<información del dispositivo>
<número de serie>X004000B231</número de serie>
<id-dispositivo>S00820BB231</id-dispositivo>
<nombre-proveedor>Roku</nombre-proveedor>
<nombre-del-modelo>Roku Ninja</nombre-del-modelo>
<número de modelo>3930X</número de modelo>
<modelo-región>EE. UU.</modelo-región>
<is-tv>falso</is-tv>
<is-stick>falso</is-stick>
<resolución ui>1080p</resolución ui>
<soporta-ethernet>falso</soporta-ethernet>
<wifi-mac>10:59:32</wifi-mac>
<wifi-controlador>realtek</wifi-controlador>
<has-wifi-extender>falso</has-wifi-extender>
<has-wifi-5G-support>verdadero</has-wifi-5G-support>
<puede-usar-wifi-extender>verdadero</puede-usar-wifi-extender>
<tipo-de-red>wifi</tipo-de-red>
<network-name>Servidor de correo electrónico de Hillary</network-name>
<nombre-de-dispositivo-amigable>Roku LivingRoom</nombre-de-dispositivo-amigable>
<nombre-del-modelo-amigable>Roku Express</nombre-del-modelo-amigable>
<nombre-dispositivo-predeterminado>Roku Express - X004000AJDX1</nombre-dispositivo-predeterminado>
<nombre-de-dispositivo-de-usuario>Roku Master</nombre-de-dispositivo-de-usuario>
<usuario-dispositivo-ubicación>LivingRoom</usuario-dispositivo-ubicación>
<número de compilación>AEA.00E04209A</número de compilación>
<versión-software>10.0.0</versión-software>
<software-build>4209</software-build>
<dispositivo-seguro>verdadero</dispositivo-seguro>
<idioma>es</idioma>
<país>EE. UU.</país>
<locale>en_US</locale>
<time-zone-auto>verdadero</time-zone-auto>
<time-zone>EE.UU./Este</time-zone>
<time-zone-name>Estados Unidos/Este</time-zone-name>
<time-zone-tz>América/Nueva_York</time-zone-tz>
<desplazamiento de la zona horaria>-240</desplazamiento de la zona horaria>
<formato-reloj>12 horas</formato-reloj>
<tiempo de actividad>2912968</tiempo de actividad>
<power-mode>Encender</power-mode>
<supports-suspend>falso</supports-suspend>
<supports-find-remote>verdadero</supports-find-remote>
<encontrar-remoto-es-posible>falso</encontrar-remoto-es-posible>
<supports-audio-guide>verdadero</supports-audio-guide>
<soporta-rva>verdadero</soporta-rva>
<habilitado para desarrolladores>falso</habilitado para desarrolladores>
<id-de-desarrollador-con-clave/>
<habilitado para búsqueda>verdadero</habilitado para búsqueda>
<search-channels-enabled>true</search-channels-enabled>
<voice-search-enabled>true</voice-search-enabled>
<notificaciones-habilitadas>verdadero</notificaciones-habilitadas>
<notificaciones-primer-uso>verdadero</notificaciones-primer-uso>
<supports-private-listening>true</supports-private-listening>
<auriculares-conectados>falso</auriculares-conectados>
<supports-ecs-textedit>verdadero</supports-ecs-textedit>
<supports-ecs-microphone>verdadero</supports-ecs-microphone>
<supports-wake-on-wlan>falso</supports-wake-on-wlan>
<supports-airplay>verdadero</supports-airplay>
<has-play-on-roku>verdadero</has-play-on-roku>
<has-mobile-screensaver>falso</has-mobile-screensaver>
<soporte-url>roku.com/soporte</soporte-url>
<grandcentral-version>5.5.62</grandcentral-version>


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
