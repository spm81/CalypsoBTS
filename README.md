# CalypsoBTS
Turn cheap Calypso based phone(s) into a GSM BTS

A Script made by me to Install CalypsoBTS on Ubuntu 16.04LTS ( Tested on 16.04 can work on many other versions )

# Installation
---------------
git clone https://github.com/spm81/CalypsoBTS.git
cd CalypsoBTS/
sudo chmod +x Install_Calypso_BTS.sh
./Install_Calypso_BTS.sh


# Info:
Clock source

Time-division (TDMA) systems require very accurate counting of the time segments (frames and timeslots) and when they start and stop. Also, multiple base stations within a network must be time-synchronized between themselves to make subscribers able to perform handover operation (switching from one BTS to another). If the towers clocking were out of sync, then communications would falter as each node would be trying to deal with segments that were slightly offset and this would introduce errors. This is why a good clock source is required to operate a base station.

The satellite systems, such as GPS and Iridium, do have pretty accurate clock that is being distributed in addition to the prime services (location, calls, etc). They could be used (and often used in commercial networks) for synchronization purposes. This approach would require one to have a corresponding receiver and a direct sky view, but there is a simpler way. We can use the SCH clock indications from existing base stations, eventually a phone is designed to do that!

So, use RSSI or cell_log applications to find cells with good signal and remember the ARFCN numbers. One of them will be used as a clock source for our own base station.
Usage

1. First, you need to run the transceiver firmware:

 cd trx/src/
 host/osmocon/osmocon -m c123xor -p /dev/ttyUSB0 -c target/firmware/board/compal_e88/trx.highram.bin

Additionally, if you have two (or more) phones, load the firmware to a second phone (optional):

 cd trx/src/
 host/osmocon/osmocon -m c123xor -p /dev/ttyUSB1 -s /tmp/osmocom_l2.2 -c target/firmware/board/compal_e88/trx.highram.bin

2. The host application could be found in 'src/host/layer23/transceiver/':

 cd trx/src/host/layer23/src/transceiver/
 ./transceiver -h

Usage: ./transceiver -a arfcn_sync
Some useful options:
  -h   --help             this text
  -d   --debug MASK       Enable debugging (e.g. -d DL1C:DTRX)
  -e   --log-level LOGL   Set log level (1=debug, 3=info, 5=notice)
  -D   --daemonize        For the process into a background daemon
  -s   --disable-color    Don't use colors in stderr log output
  -a   --arfcn-sync ARFCN Set ARFCN to sync to
  -p   --arfcn-sync-pcs   The ARFCN above is PCS
  -2   --second-phone     Use second phone for TS 1
  -r   --realtime PRIO    Set realtime scheduler with given prio

The --arfcn-sync or --arfcn-sync-pcs are used to specify the ARFCN of a clock source cell. The high priority scheduling is recommended for low-performance PCs.

3. Let's try to synchronize with a BTS:

If you have two (or more phones), add '-2' option.

 ./transceiver -a <ARFCN>

You should see something like this:

<0012> l1ctl.c:383 Reset received: Starting sync.
<0012> l1ctl.c:338 Sync acquired, setting BTS mode ...
<0011> trx.c:194 TRX CLK Indication 1255520
<0011> trx.c:194 TRX CLK Indication 1255571
<0011> trx.c:194 TRX CLK Indication 1255622
<0011> trx.c:194 TRX CLK Indication 1255673
<0011> trx.c:194 TRX CLK Indication 1255724
<0011> trx.c:194 TRX CLK Indication 1255775
<0011> trx.c:194 TRX CLK Indication 1255826
<0011> trx.c:194 TRX CLK Indication 1255877
<0011> trx.c:194 TRX CLK Indication 1255928
<0011> trx.c:194 TRX CLK Indication 1255979
<0011> trx.c:194 TRX CLK Indication 1256030
<0011> trx.c:194 TRX CLK Indication 1256081

If something goes wrong, find another ARFCN and try again.
As soon as you get the transceiver synchronized, just keep it running.


# + INFO:

Original link: https://osmocom.org/projects/baseband/wiki/CalypsoBTS

https://www.smartspate.com/how-to-create-2g-network-at-your-own-home/
https://security-bits.de/research/cellular/lab_setup
https://weekly-geekly.github.io/articles/331406/index.html

