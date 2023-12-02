RED='\x1b[31;01m'
GREEN='\x1b[32;01m'
BOLD='\x1b[1m'
NORMAL='\x1b[0m'
HIGHLIGHT='\e[30;48;5;41m'


.SILENT:

all: a b


a:
	cd at_client && $(MAKE)

b:
	cd blinky && $(MAKE)

clean_a:
	cd at_client && $(MAKE) clean

clean_b:
	cd blinky && $(MAKE) clean

clean: clean_a clean_b
