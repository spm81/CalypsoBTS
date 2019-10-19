sudo apt install libtool shtool automake autoconf git-core pkg-config make gcc -y
sudo apt-get install build-essential libtool libtalloc-dev shtool autoconf automake git-core pkg-config make gcc libpcsclite-dev libgnutls-dev -y
sudo apt-get install build-essential libgmp-dev libx11-6 libx11-dev flex libncurses5 libncurses5-dev libncursesw5 libpcsclite-dev zlib1g-dev libmpfr4 libmpc3 lemon aptitude libtinfo-dev libtool shtool autoconf git-core pkg-config make libmpfr-dev libmpc-dev libtalloc-dev libfftw3-dev libgnutls28-dev libssl-dev libtool-bin libxml2-dev sofia-sip-bin libsofia-sip-ua-dev sofia-sip-bin libncursesw5-dev libncursesw5-dbg bison libgmp3-dev alsa-oss -y
sudo apt install gcc-arm-none-eabi -y


git clone git://git.osmocom.org/libosmocore.git
cd libosmocore/
autoreconf -i
./configure
make
sudo make install
sudo ldconfig -i
cd ..


git clone git://git.osmocom.org/osmocom-bb.git
cd osmocom-bb
git pull --rebase

cd src
make -e CROSS_TOOL_PREFIX=arm-none-eabi-
cd ..
cd ..

git clone git://git.osmocom.org/libosmo-dsp.git
cd libosmo-dsp/
autoreconf -i
./configure
make
sudo make install
cd ..

git clone git://git.osmocom.org/osmocom-bb.git -b jolly/testing trx
cd trx/src/
make HOST_layer23_CONFARGS=--enable-transceiver








