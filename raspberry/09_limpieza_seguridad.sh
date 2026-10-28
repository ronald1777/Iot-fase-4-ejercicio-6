#!/bin/bash
# Limpieza de seguridad al terminar: elimina las claves de la sesion actual.
# Ejecutar con "source" para que afecte a la terminal abierta:  source 09_limpieza_seguridad.sh
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_DEFAULT_REGION
history -c
echo "Variables AWS eliminadas de la sesion. Cierre la terminal SSH."
