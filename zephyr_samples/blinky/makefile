RED='\x1b[31;01m'
GREEN='\x1b[32;01m'
BOLD='\x1b[1m'
NORMAL='\x1b[0m'
HIGHLIGHT='\e[30;48;5;41m'


.SILENT:

all:
	echo -e "$(GREEN)Building Blinky for nrf9160dk_nrf9160$(NORMAL)"
	west build -b nrf9160dk_nrf9160

prog:
	nrfjprog --program build/zephyr/zephyr.hex --chiperase --verify --pinreset

clean:
	rm -rf build
