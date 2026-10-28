#!/bin/bash
# Fase 5: publica mensajes JSON de prueba en el broker local.
# Deben verse en la consola de AWS IoT Core > Probar > Cliente de prueba de MQTT,
# suscrito a "seccion10/#".
# Uso: bash 08_publicar_prueba.sh NOMBRE_EQUIPO
EQUIPO="${1:-equipo1}"
for i in 1 2 3 4 5; do
  TEMP=$(awk -v s=$RANDOM 'BEGIN{srand(s); printf "%.2f", 20+rand()*10}')
  mosquitto_pub -h localhost -p 1883 -t "seccion10/$EQUIPO/temperatura" \
    -m "{\"equipo\": \"$EQUIPO\", \"temperatura\": $TEMP, \"muestra\": $i}"
  echo "Publicado ($i/5): temperatura=$TEMP"
  sleep 2
done
