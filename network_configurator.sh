#!/bin/bash

# Zapytaj użytkownika o statyczny adres IP oraz bramę
read -p "Podaj statyczny adres IP: " static_ip
read -p "Podaj adres bramy: " gateway

# Sprawdzenie, czy zmienne są puste
if [[ -z "$static_ip" || -z "$gateway" ]]; then
    echo "Adres IP i brama nie mogą być puste."
    exit 1
fi

# Zapisanie nowej konfiguracji do pliku
{
  echo "# This is the network config written by 'subiquity'"
  echo "network:"
  echo "  renderer: networkd"
  echo "  ethernets:"
  echo "    ens18:"
  echo "      dhcp4: no                 # Wylaczenie DHCP (dynamiczne przydzielanie IP)"
  echo "      addresses:"
  echo "        - ${static_ip}/24      # Statyczny adres IP z maską podsieci"
  echo "      routes:"
  echo "        - to: 0.0.0.0/0"
  echo "          via: ${gateway}     # Brama domyślna"
  echo "      nameservers:"
  echo "        addresses:"
  echo "          - 8.8.8.8"
  echo "          - 8.8.4.4"
  echo "  version: 2"
} > /etc/netplan/00-installer-config.yaml

# Zastosowanie nowej konfiguracji
netplan apply

echo "Konfiguracja sieci została zaktualizowana!"
