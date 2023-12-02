RED=\x1b[31;01m
GREEN:=\x1b[32;01m
BOLD=\x1b[1m
NORMAL=\x1b[0m
HIGHLIGHT=\e[30;48;5;41m


.SILENT:

all:
	echo -e "$(GREEN)Building AT_Client for nrf9160dk_nrf9160_ns$(NORMAL)"
	west build -b nrf9160dk_nrf9160_ns

prog:
	nrfjprog --program build/zephyr/merged.hex --chiperase --verify --pinreset

clean:
	rm -rf build
