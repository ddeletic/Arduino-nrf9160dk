
#include <nrfx.h>
#include <nrf_modem_at.h>
#include <hal/nrf_gpio.h>

// #include <zephyr.h>
// #include <device.h>


// #include <sys/util.h>
// #include <sys/printk.h>
// #include <inttypes.h>
// #include <logging/log.h>

// #include <date_time.h>

#include <modem/nrf_modem_lib.h>
#include <modem/lte_lc.h>

#include "config.secret.h"

#define SLEEP_TIME_MS	1

// LOG_MODULE_REGISTER(main);

int slm_vbat(int* bat_mv){
    int ret;
    char response[1024];

    ret = nrf_modem_at_cmd(response, sizeof(response), "AT%%XVBAT");
    if(ret == 0){
        char* start = strchr(response, ':')+1;
        char* end = strchr(start, '\n');
        *bat_mv = strtol(start, &end, 10);
    }
    return ret;
}

void modem_init(void){
    int err;

    if (IS_ENABLED(CONFIG_LTE_AUTO_INIT_AND_CONNECT)) {
        /* Do nothing, modem is already configured and LTE connected. */
    } else {
        err = lte_lc_init();
        if (err) {
            printk("Modem initialization failed, error: %d\n", err);
            return;
        }
    }
}


// int configure_low_power(void){
//     int err;

//     /** Power Saving Mode */
//     err = lte_lc_psm_req(true);
//     if (err) {
//         printk("lte_lc_psm_req, error: %d\n", err);
//     }

//     /** enhanced Discontinuous Reception */
//     err = lte_lc_edrx_req(true);
//     if (err) {
//         printk("lte_lc_edrx_req, error: %d\n", err);
//     }

//     // /** Release Assistance Indication  */
//     // err = lte_lc_rai_req(true);
//     // if (err) {
//         // printk("lte_lc_rai_req, error: %d\n", err);
//     // }


//     return err;
// }

// int modem_network_register(void){
//     int ret;
//     // char response[256];

//     ret = nrf_modem_at_printf("AT");
//     // if(ret == 0){LOG_INF("AT initialised");}
//     // else if (ret < 0){LOG_ERR("AT initialisation error"); return ret;}

//     ret = nrf_modem_at_printf("AT+CGDCONT=0,\"IP\",\"%s\"", APN);
//     // if(ret == 0){LOG_INF("CGDCONT ok");}
//     // else if (ret < 0){LOG_ERR("CGDCONT error"); return ret;}

//     ret = nrf_modem_at_printf("AT+CFUN=1");
//     // if(ret == 0){LOG_INF("CFUN on ok");}
//     // else if (ret < 0){LOG_ERR("CFUN on error"); return ret;}

//     //may get stuck here if there is no network...
//     ret = nrf_modem_at_printf("AT+COPS=1,2,\"%s\"", NETWORK_OPERATOR);
//     // if(ret == 0){LOG_INF("COPS register ok");}
//     // else if (ret < 0){LOG_ERR("COPS register error"); return ret;}

//     return 0;
// }

void setup(){
    modem_init();
    // configure_low_power();
    // modem_network_register();
    nrf_modem_lib_init();

    int ret;
    char response[1024];
    Serial.print("sending AT. Response: ");
    ret = nrf_modem_at_cmd(response, sizeof(response), "AT");
    Serial.println(response);
}

void loop(void){
    int bat_mv;
    slm_vbat(&bat_mv);
    Serial.print("SLM battery voltage: ");
    Serial.print(bat_mv);
    Serial.println(" (mV)");

    k_msleep(1000);
}