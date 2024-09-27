.. _ug_nrf70_developing_offloaded_raw_tx:

Offloaded raw transmit operation
################################

.. contents::
   :local:
   :depth: 2

The nRF70 series ICs can be used as offloaded raw transmit devices wherein the nRF70 series device can transmit frames at regular intervals utilizing very low power. The contents of the frame as well as parameters such as frequency and channel of transmission etc. are programmable. The major functionality of transmitting the frames is offloaded to the nRF70 device thereby placing very minimal requirements on the host (mainly programming capability) thereby leading to very little host memory requirements (Flash and RAM). 

This can serve as an ideal solution for applications such as indoor navigation and tracking, where the anchor nodes need to do low-power beaconing. Anchor devices can transmit beacon-compliant packets containing tracking/location information inside the BSSID/SSID fields. This information can then be used by the devices that scan for these beacon-compliant packets.

The Offloaded Raw TX is supported as a separate stand-alone compile-time mode of operation in the Wi-Fi driver and is exclusive to the already existing modes of operation, i.e.:

1. `Wi-Fi mode` and
2. `Radio Test mode`

In addition to providing start/stop control over the offloaded raw transmit operation, the driver supports updating the configuration parameters as below:

Frame contents
Channel of operation
Data rate
Rate flags
Periodicity of transmission
Transmit power

.. _ug_nrf70_developing_enabling_offloaded_raw_tx:

Offloaded raw transmit API
**************************

The offloaded raw transmit functionality offered by nRF70 series ICs can be exercised using the APIs exposed by the driver. The API reference can be found at:

| Header file: :file:`zephyr/drivers/wifi/nrfwifi/off_raw_tx/off_raw_tx_api.h`


The usage of the API is demonstrated by the :ref:`Offloaded raw transmit sample <wifi_offloaded_raw_tx_packet_sample>`

.. _ug_nrf70_developing_offloaded_raw_tx_power_consumption:

Power consumption
*****************

The power consumed by the nRF70 device during the offloaded raw TX operation is dependent on:

1. Operating data rate (e.g. 6 Mbps, MCS0 etc.) : Power consumption decreases as the data rate increases.
2. Payload length : Power consumption increases with the payload length.
3. Periodicity of transmission : Power consumption increases as the period between successive transmissions decreases.
4. Transmit power : Power consumption increases as the transmit power is increased.

The simulated power profiler can be found at:
https://devzone.nordicsemi.com/power/w/opp/14/online-power-profiler-for-wi-fi

