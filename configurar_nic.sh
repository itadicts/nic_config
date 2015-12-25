#!/bin/bash
# Creado por ITAdicts
# Diciembre 2015
# Version 1.0


echo "Bienvenido al script de configuración de NIC"

fichero=/etc/network/interfaces

# NOMBRE NIC
echo "Introduce el nombre de la tarjeta que desea configurar (Ej. eth0 / eth1):"
read nombre

# IP NIC
echo "Introduce la IP de la tarjeta:"
read direccion

# MASCARA
echo "Introduce la mascara de red:"
read mascara

# DEFAULT GATEWAY
echo "Introduce la direccion de la puerta de enlace:"
read gateway

# BROADCAST
echo "Introduce la direccion de broadcast:"
read broadcast

# DNS
echo "Introduce los DNS (Max. 3 separados por espacios):"
read dns

echo "" | sudo tee -a $fichero
echo "#NIC: $nombre" | sudo tee -a $fichero
echo "auto $nombre" | sudo tee -a $fichero
echo "iface $nombre inet static" | sudo tee -a $fichero
echo "address $direccion" | sudo tee -a $fichero
echo "netmask $mascara" | sudo tee -a $fichero
echo "gateway $gateway" | sudo tee -a $fichero
echo "broadcast $broadcast" | sudo tee -a $fichero
echo "dns-nameservers $dns" | sudo tee -a $fichero

sudo ifdown $nombre
sudo ifup $nombre

echo "Tarjeta configurada correctamente. Adios!"
