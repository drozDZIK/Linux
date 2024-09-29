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
cat <<EOL > /etc/netplan/00-installer-config.yaml
# This is the network config written by 'subiquity'
network:
  renderer: networkd
  ethernets:
    ens18:
      dhcp4: no                 # Wylaczenie DHCP (dynamiczne przydzielanie IP)
      addresses:
        - ${static_ip}/24      # Statyczny adres IP z maską podsieci
      routes:
        - to: 0.0.0.0/0
          via: ${gateway}     # Brama domyślna
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
  version: 2
EOL

# Zastosowanie nowej konfiguracji
netplan apply

echo "Konfiguracja sieci została zaktualizowana!"
