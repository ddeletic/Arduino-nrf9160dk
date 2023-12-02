/*
 * SPDX-License-Identifier: Apache-2.0
 */

#include <Arduino.h>

#define SLEEP_TIME_MS 2300

////////////////////////////////////////////////////////////////////////////////
void another_function (void)
{
    Serial.println("Hello from another world!");
}

////////////////////////////////////////////////////////////////////////////////
void setup() {
    Serial.begin(115200);

    pinMode(LED_BUILTIN, OUTPUT);

    int bytes_written = Serial.println("Hello, World!");
    printk("bytes_written: %d\n", bytes_written);
    Serial.println();
}

////////////////////////////////////////////////////////////////////////////////
void loop() {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(SLEEP_TIME_MS);
    another_function();
    Serial.println("Hello again!");
    digitalWrite(LED_BUILTIN, LOW);
    delay(SLEEP_TIME_MS);
}
