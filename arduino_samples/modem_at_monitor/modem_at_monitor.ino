#include <modem/nrf_modem_lib.h>
#include <zephyr/drivers/clock_control/nrf_clock_control.h>

void setup() {
	// put your setup code here, to run once:
	int err = nrf_modem_lib_init();

	// Enable xtal
	struct onoff_manager *clk_mgr;
	static struct onoff_client cli = {};

	clk_mgr = z_nrf_clock_control_get_onoff(CLOCK_CONTROL_NRF_SUBSYS_HF);
	sys_notify_init_spinwait(&cli.notify);
	(void)onoff_request(clk_mgr, &cli);
}

void loop() {
  // put your main code here, to run repeatedly:

}
