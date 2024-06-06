#!/bin/bash

# Directorio con las carpetas de fechas
server="/mnt/server/"
folder_updates="/mnt/updates/Nod32/"

# Frecuencia de ejecución (en días)
#frecuencia_ejecucion=3

# Función para obtener la última carpeta por fecha
function obtener_last_carpeta() {
  last_carpeta=$(ls -d -t $server* | head -n 1 )
  #devuelve formato /mnt/server/06-07-2024
}

# Función para verificar y actualizar la actualización de Nod32
function actualizar_nod32() {
  # Obtener la última carpeta por fecha
  obtener_last_carpeta

  # Si no se encontró ninguna carpeta, salir
  if [ -z "$last_carpeta" ]; then
    echo "No se encontraron carpetas en $server"
    return
  fi


  #Nombre comprimido
  comprimido=$(ls $last_carpeta/Actualizacion\ Antivirus/ | grep 'Nod\ 32\ .*\.zip' | head -n 1)
  #Devuelve Nod 32 [30-05-24].zip

  #Copiar a updates
  comprimido_path=$(echo "$last_carpeta/Actualizacion\ Antivirus/")
  rm -r $folder_updates/*
  cp $last_carpeta/Actualizacion\ Antivirus/Nod*.zip $folder_updates
  unzip $folder_updates/Nod*.zip -d $folder_updates/

}

# Ejecutar la función para verificar y actualizar Nod32
# Se ha eliminado la llamada a la función aquí
