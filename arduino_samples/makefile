RED='\x1b[31;01m'
GREEN='\x1b[32;01m'
YELLOW='\x1b[33;01m'
BOLD='\x1b[1m'
NORMAL='\x1b[0m'
HIGHLIGHT='\e[30;48;5;41m'


.SILENT:

#-------------------------------------------------------------------------------
#
# We use arduino-cli.exe for building these samples. Let's check
# if it is present on our system
#
ifeq (1, $(shell if [ -e $(CURDIR)/arduino-cli.exe ]; then echo 1; fi))
  ARDUINO_CLI_PATH := ./arduino-cli.exe
else
  ifeq (0, $(shell which arduino-cli.exe 2>&1 /dev/null))
    ARDUINO_CLI_PATH := arduino-cli.exe
  else
    $(info [ERROR] arduino-cli.exe is missing)
    $(info . . . . It must be either in this directory or in system path)
    $(error  )
  endif
endif


#-------------------------------------------------------------------------------
all: a b

#-------------------------------------------------------------------------------
a:
	echo -e "$(GREEN)Building modem_at_client$(NORMAL)"
	$(ARDUINO_CLI_PATH) compile \
		--output-dir modem_at_client/build \
		--fqbn bosl:nrf9160:nrf9160dk modem_at_client/modem_at_client.ino
clean_a:
	rm -rf modem_at_client/build
prog_a:
	nrfjprog --program modem_at_client/build/modem_at_client.ino.hex --chiperase --verify --pinreset


#-------------------------------------------------------------------------------
b:
	echo -e "$(GREEN)Building blinky$(NORMAL)"
	$(ARDUINO_CLI_PATH) compile \
		--output-dir blinky/build \
		--fqbn bosl:nrf9160:nrf9160dk blinky/blinky.ino
clean_b:
	rm -rf blinky/build
prog_b:
	nrfjprog --program blinky/build/blinky.ino.hex --chiperase --verify --pinreset


#-------------------------------------------------------------------------------
m:
	echo -e "$(GREEN)Building modem_at_monitor$(NORMAL)"
	$(ARDUINO_CLI_PATH) compile \
		--output-dir modem_at_monitor/build \
		--fqbn bosl:nrf9160:nrf9160dk modem_at_monitor/modem_at_monitor.ino
clean_m:
	rm -rf modem_at_monitor/build
prog_m:
	nrfjprog --program modem_at_monitor/build/modem_at_monitor.ino.hex --chiperase --verify --pinreset



#-------------------------------------------------------------------------------
clean: clean_a clean_b

