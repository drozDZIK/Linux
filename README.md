# Linux
Linux

1) **regenerate_ssh_host_keys.txt.txt**

   Useful for:
- Worth adding to the template used for cloning new VMs.

[PL] Ten skrypt jednostki systemd jest zaprojektowany do automatycznej regeneracji kluczy hosta SSH. Usuwa wszystkie istniejące klucze hosta SSH, a następnie generuje nowe za pomocą polecenia ssh-keygen. Przed generowaniem kluczy poprawia entropię systemu, przesyłając dane losowe z sprzętowego generatora liczb losowych do /dev/urandom. Po regeneracji kluczy skrypt dezaktywuje siebie, aby działał tylko raz, zazwyczaj przy pierwszym uruchomieniu lub po klonowaniu systemu. Jest to szczególnie przydatne w scenariuszach takich jak klonowanie maszyn wirtualnych, zapewniając, że każdy klon ma unikalne klucze SSH w celach bezpieczeństwa.

[ENG] This systemd unit script is designed to regenerate SSH host keys automatically. It removes any existing SSH host keys, then generates new ones using the ssh-keygen command. Before generating the keys, it enhances the system's entropy by transferring random data from the hardware random number generator to /dev/urandom. After the keys are regenerated, the script disables itself to ensure it only runs once, typically at the first boot or after system cloning. This is especially useful in scenarios like cloning virtual machines, ensuring each clone has unique SSH keys for security purposes.


2) network_configurator.sh

- download this script
- add permissions chmod +x network_configurator.sh
- run script ./network_configurator.sh


[PL] Skrypt w Bashu służy do konfigurowania statycznego adresu IP oraz bramy na maszynie wirtualnej z systemem Ubuntu. Po uruchomieniu skryptu użytkownik jest proszony o wprowadzenie statycznego adresu IP oraz adresu bramy. Następnie skrypt sprawdza, czy wprowadzone dane są poprawne, a następnie generuje odpowiednią konfigurację w pliku /etc/netplan/00-installer-config.yaml. Na koniec skrypt aplikuje zmiany za pomocą polecenia netplan apply, co skutkuje natychmiastową aktualizacją ustawień sieciowych.

[ENG] The Bash script is used to configure a static IP address and gateway on a virtual machine running Ubuntu. Upon execution, the user is prompted to enter a static IP address and gateway address. The script then checks if the entered data is valid and generates the appropriate configuration in the /etc/netplan/00-installer-config.yaml file. Finally, the script applies the changes using the netplan apply command, resulting in an immediate update of the network settings.