#!/bin/bash

# -------- INSTALACIÓN DEPENDENCIAS Y srsRAN --------
sudo add-apt-repository -y ppa:softwareradiosystems/srsran
sudo apt-get update
sudo apt-get install -y srsran
sudo apt-get install -y build-essential cmake libfftw3-dev libmbedtls-dev \
    libboost-program-options-dev libconfig++-dev libsctp-dev

# -------- CLONAR Y COMPILAR srsRAN_4G --------
git clone https://github.com/srsRAN/srsRAN_4G.git
cd srsRAN_4G
mkdir -p build
cd build
cmake ../
make -j$(nproc)
make test
sudo make install
srsran_install_configs.sh user

echo "[*] srsRAN instalado y configuraciones por defecto generadas."
