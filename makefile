.SILENT:


.PHONY: pack

all: build_zephyr_samples pack copy build_arduino

release: clean build_zephyr_samples pack dist

test: qpack qcopy build_arduino



pack: build_zephyr_sample
	cd ${CURDIR} &&./mk_package.sh
qpack: build_zephyr_samples
	cd ${CURDIR} && ./mk_package.sh -q

copy:
	cd ${CURDIR} &&./local_copy.sh
qcopy:
	cd ${CURDIR} &&./local_copy.sh -q
build_arduino:
	cd arduino_samples && $(MAKE)
build_zephyr_sample: 
	cd zephyr_samples && $(MAKE) a
build_zephyr_samples: 
	cd zephyr_samples && $(MAKE)

dist:
	cd ${CURDIR} &&./mk_dist.sh

clean_samples:
	cd arduino_samples && $(MAKE) clean
	cd zephyr_samples  && $(MAKE) clean
clean_package:
	rm -rf bosl
clean_local_install:
	rm -rf ${ARDUINO_PATH}/packages/bosl
clean: clean_samples clean_package clean_local_install

