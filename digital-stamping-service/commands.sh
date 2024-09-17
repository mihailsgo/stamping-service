#!/bin/bash
pcscd --disable-polkit
utnm -c "set autoconnect=true  84.50.77.2 1"
utnm -c "set autoconnect=true  84.50.77.2 2"
java --add-exports=jdk.crypto.cryptoki/sun.security.pkcs11.wrapper=ALL-UNNAMED -jar /opt/app/dmss-digital-stamping-service.jar
