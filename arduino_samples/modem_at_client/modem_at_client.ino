/*
 * Copyright (c) 2018 Nordic Semiconductor ASA
 *
 * SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
 */

#include <zephyr/kernel.h>
#include <stdio.h>
#include <string.h>
#include <modem/nrf_modem_lib.h>
#include <zephyr/drivers/uart.h>
#include <zephyr/drivers/clock_control.h>
#include <zephyr/drivers/clock_control/nrf_clock_control.h>
#include <Arduino.h>

#define SLEEP_TIME_MS 2300

////////////////////////////////////////////////////////////////////////////////
void another_function (void)
{
    Serial.println("Hello from another world!");
}

////////////////////////////////////////////////////////////////////////////////
// To strictly comply with UART timing, enable external XTAL oscillator
void enable_xtal(void)
{
	struct onoff_manager *clk_mgr;
	static struct onoff_client cli = {};

	clk_mgr = z_nrf_clock_control_get_onoff(CLOCK_CONTROL_NRF_SUBSYS_HF);
	sys_notify_init_spinwait(&cli.notify);
	(void)onoff_request(clk_mgr, &cli);
}

////////////////////////////////////////////////////////////////////////////////
void setup() 
{
    Serial.begin(115200);

    pinMode(LED_BUILTIN, OUTPUT);

    int bytes_written = Serial.println("Hello, World!");
    printk("bytes_written: %d\n", bytes_written);
    Serial.println();

#define BUILD_MODEM_LIB
#ifdef  BUILD_MODEM_LIB
	printk("The AT host sample started\n");

	int err = nrf_modem_lib_init();
	if (err) {
		printk("Modem library initialization failed, error: %d\n", err);
//		return 0;
	}
#endif
	enable_xtal();
	printk("Ready\n");
}

////////////////////////////////////////////////////////////////////////////////
void loop() 
{
    digitalWrite(LED_BUILTIN, HIGH);
    delay(SLEEP_TIME_MS);
    another_function();
    Serial.println("Hello again!");
    digitalWrite(LED_BUILTIN, LOW);
    delay(SLEEP_TIME_MS);
}

