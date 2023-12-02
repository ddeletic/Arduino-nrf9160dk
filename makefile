.SILENT:


.PHONY: pack

all: build_zephyr_samples pack copy build_arduino

test: qpack qcopy build_arduino



pack:
	cd ${CURDIR} &&./mk_package.sh
qpack:
	cd ${CURDIR} && ./mk_package.sh -q

copy:
	cd ${CURDIR} &&./local_copy.sh
qcopy:
	cd ${CURDIR} &&./local_copy.sh -q
build_arduino:
	cd arduino_samples && $(MAKE)
build_zephyr_samples:
	cd zephyr_samples && $(MAKE)

dist:
	cd ${CURDIR} &&./mk_dist.sh

clean_samples:
	cd arduino_samples && $(MAKE) clean
	cd zephyr_samples  && $(MAKE) clean
clean_package:
	rm -rf \
		bosl/tools \
		bosl/hardware/nrf9160/1.0.0/inc \
		bosl/hardware/nrf9160/1.0.0/lib
clean_local_install:
	rm -rf ${ARDUINO_PATH}/packages/bosl
clean: clean_samples clean_package clean_local_install

