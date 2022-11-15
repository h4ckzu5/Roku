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


Más enumeración


http://192.168.X.X:8060/query/device-info

curl http://192.168.X.X:8060/query/device-info


Esto producirá una página XML



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
