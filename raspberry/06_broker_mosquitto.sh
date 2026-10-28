#!/bin/bash
# Complemento a la Fase 4: la regla de ruteo usa brokerServerUri "tcp://localhost:1883",
# por lo que debe existir un broker MQTT escuchando en el puerto 1883 de la Raspberry Pi.
set -e
sudo apt install mosquitto mosquitto-clients -y
sudo tee /etc/mosquitto/conf.d/local.conf > /dev/null << 'CONF'
listener 1883
allow_anonymous true
CONF
sudo systemctl enable mosquitto
sudo systemctl restart mosquitto
sudo systemctl status mosquitto --no-pager
