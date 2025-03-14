.. _matter_manufacturer_specific_sample:

Matter: Manufacturer-specific
#############################

.. contents::
   :local:
   :depth: 2

This sample demonstrates an implementation of custom manufacturer-specific clusters used by the application layer.
This sample uses development kit's buttons and LEDs to demonstrate the functionality of the custom ``NordicDevkit`` cluster.
The device works as a Matter accessory device, meaning it can be paired and controlled remotely over a Matter network built on top of a low-power, 802.15.4 Thread network.
You can use this sample as a reference for creating your own application.

Requirements
************

The sample supports the following development kits:

.. table-from-sample-yaml::

For testing purposes, that is to commission the device and :ref:`control it remotely <matter_manufacturer_specific_network_mode>` through a Thread network, you also need a Matter controller device :ref:`configured on PC or smartphone <ug_matter_configuring>`.
This requires additional hardware depending on the setup you choose.

.. note::
    |matter_gn_required_note|

Overview
********
.. tabs::

   .. group-tab:: nRF52 and nRF53 DKs

      The sample starts the Bluetooth® LE advertising automatically and prepares the Matter device for commissioning into a Matter-enabled Thread network.
      The sample uses the **LED 1** to show the state of the connection.
      You can press **Button 1** to start the factory reset when needed.
      **Button 2** and **Button 3** are used to toggle the state of ``NordicDevkit`` cluster's attributes, ``LED2`` and ``LED3`` respectively.
      Matter command ``SetLED`` is used to control the state of  ``LED2`` and ``LED3``.
      It takes two arguments: the LED number (``2`` or ``3`` for ``LED2`` or ``LED3`` attribute) and the action to be performed (``0`` to turn the LED off, ``1`` to turn it on, ``2`` to toggle the state).
      **LED 2** and **LED 3** reflect the state of the ``LED2`` and ``LED3``.
      ``NordicDevkit`` cluster additionally introduces a writable ``DevKitName`` attribute, of string type.

   .. group-tab:: nRF54 DKs

      The sample starts the Bluetooth® LE advertising automatically and prepares the Matter device for commissioning into a Matter-enabled Thread network.
      The sample uses the **LED 0** to show the state of the connection.
      You can press **Button 0** to start the factory reset when needed.
      **Button 1** and **Button 2** are used to toggle the state of ``NordicDevkit`` cluster's attributes, ``LED2`` and ``LED3`` respectively.
      Matter command ``SetLED`` is used to control the state of  ``LED2`` and ``LED3``.
      It takes two arguments: the LED number (``2`` or ``3`` for ``LED2`` or ``LED3`` attribute) and the action to be performed (``0`` to turn the LED off, ``1`` to turn it on, ``2`` to toggle the state).
      **LED 1** and **LED 2** reflect the state of the ``LED2`` and ``LED3``.
      ``NordicDevkit`` cluster additionally introduces a writable ``DevKitName`` attribute, of string type.


Custom manufacturer-specific cluster
====================================

The sample provides a custom ``NordicDevkit`` cluster, configured in the :file:`src/default_zap/NordicDevKitCluster.xml` file.
To learn more about adding custom clusters to your Matter application, see the :ref:`ug_matter_creating_custom_cluster` section.

.. _matter_manufacturer_specific_network_mode:

Remote testing in a network
===========================

By default, the Matter accessory device has no IPv6 network configured.
You must pair it with the Matter controller over Bluetooth LE to get the configuration from the controller to use the device within a Thread network.
The controller must get the `Onboarding information`_ from the Matter accessory device and provision the device into the network.
For details, see the `Commissioning the device`_ section.

Configuration
*************

|config|

.. _matter_manufacturer_specific_custom_configs:

Matter manufacturer-specific sample with Trusted Firmware-M
===========================================================

.. include:: ../template/README.rst
    :start-after: matter_template_build_with_tfm_start
    :end-before: matter_template_build_with_tfm_end

Advanced configuration options
==============================

This section describes other configuration options for the sample.

Device Firmware Upgrade support
-------------------------------

.. |Bluetooth| replace:: Bluetooth

.. include:: ../lock/README.rst
    :start-after: matter_door_lock_sample_build_with_dfu_start
    :end-before: matter_door_lock_sample_build_with_dfu_end

Factory data support
--------------------

.. include:: ../lock/README.rst
    :start-after: matter_door_lock_sample_factory_data_start
    :end-before: matter_door_lock_sample_factory_data_end

User interface
**************

.. tabs::

   .. group-tab:: nRF52 and nRF53 DKs

      LED 1:
         .. include:: /includes/matter_sample_state_led.txt

      LED 2:
         Reflects the state of ``LED2`` attribute in the ``NordicDevkit`` cluster.

      LED 3:
         Reflects the state of ``LED3`` attribute in the ``NordicDevkit`` cluster.

      Button 1:
         .. include:: /includes/matter_sample_button.txt

      Button 2:
         Toggles the state of ``LED2`` attribute in the ``NordicDevkit`` cluster.

      Button 3:
         Toggles the state of ``LED3`` attribute in the ``NordicDevkit`` cluster.

      .. include:: /includes/matter_segger_usb.txt

   .. group-tab:: nRF54 DKs

      LED 0:
         .. include:: /includes/matter_sample_state_led.txt

      LED 1:
         Reflects the state of ``LED2`` attribute in the ``NordicDevkit`` cluster.

      LED 2:
         Reflects the state of ``LED3`` attribute in the ``NordicDevkit`` cluster.

      Button 0:
         .. include:: /includes/matter_sample_button.txt

      Button 1:
         Toggles the state of ``LED2`` attribute in the ``NordicDevkit`` cluster.

      Button 2:
         Toggles the state of ``LED3`` attribute in the ``NordicDevkit`` cluster.

      .. include:: /includes/matter_segger_usb.txt


Building and running
********************

.. |sample path| replace:: :file:`samples/matter/manufacturer_specific`

.. include:: /includes/build_and_run.txt

See `Configuration`_ for information about building the sample with the DFU support.

Enabling remote control
=======================

Remote control allows you to control the Matter manufacturer-specific device from a Thread network.

`Commissioning the device`_ allows you to set up a testing environment and remotely control the sample over a Matter-enabled Thread network.

.. _matter_manufacturer_specific_sample_remote_control_commissioning:

Commissioning the device
------------------------

.. include:: ../light_bulb/README.rst
    :start-after: matter_light_bulb_sample_commissioning_start
    :end-before: matter_light_bulb_sample_commissioning_end

.. _matter_manufacturer_specific_network_mode_onboarding:

Onboarding information
++++++++++++++++++++++

When you start the commissioning procedure, the controller must get the onboarding information from the Matter accessory device.
The onboarding information representation depends on your commissioner setup.

For this sample, you can use one of the following :ref:`onboarding information formats <ug_matter_network_topologies_commissioning_onboarding_formats>` to provide the commissioner with the data payload that includes the device discriminator and the setup PIN code:

  .. list-table:: Manufacturer-specific sample onboarding information
     :header-rows: 1

     * - QR Code
       - QR Code Payload
       - Manual pairing code
     * - Scan the following QR code with the app for your ecosystem:

         .. figure:: ../../../doc/nrf/images/matter_qr_code_template_sample.png
            :width: 200px
            :alt: QR code for commissioning the manufactuter specific device

       - MT:Y.K9042C00KA0648G00
       - 34970112332

.. include:: ../lock/README.rst
    :start-after: matter_door_lock_sample_onboarding_start
    :end-before: matter_door_lock_sample_onboarding_end

|matter_cd_info_note_for_samples|

Testing
=======

After `Enabling remote control`_, you can test the ``NordicDevkit`` cluster's attributes and commands.

Testing custom cluster
----------------------

To test ``NordicDevkit`` cluster's attributes and commands, complete the following steps:

1. |connect_kit|
#. |connect_terminal_ANSI|
#. Commission an accessory with node ID equal to 1 to the Matter network by following the steps described in the `Commissioning the device`_ section.
#. Read the attributes by index using the chip-tool:

   .. parsed-literal::
      :class: highlight

      chip-tool any read-by-id read-by-id 0xFFF1FC01 *attribute-id* 1 1

   * *attribute-id* is the attribute's ID, equal to ``1`` for ``DevKitName``, ``2`` for ``LED2`` and ``3`` for ``LED3`` attributes for ``NordicDevkit`` cluster in this sample.
#. Verify that all attributes have been read correctly and are equal to the default values defined in cluster's configuration.
#. Write the ``DevkitName`` attribute:

   .. parsed-literal::
         :class: highlight

         chip-tool any write-by-id 0xFFF1FC01 1 "NewName" 1 1

#. Read the ``DevkitName`` attribute again to check if it has changed.
#. Press the button assigned to the LED attribute you want to control, check if the LED state changes and if the attribute value is updated.
#. Send the ``SetLED`` command to the device to control the LED state:

   .. parsed-literal::
         :class: highlight

         chip-tool any command-by-id 0xFFF1FC01 0 '{ "0x0": "u:*led-id*", "0x1": "u:*action*" }' 1 1

   * *led-id* is the LED attribute's ID, ``2`` for ``LED2`` and ``3`` for ``LED3``.
   * *action* is the action that should be performed on LED attribute: ``0`` to turn the LED off, ``1`` to turn it on, ``2`` to toggle the state.

#. Verify that the LED state has changed and the attribute value is updated.

#. Reboot the device and check if the attributes are persisting after joining the network.

Upgrading the device firmware
=============================

To upgrade the device firmware, complete the steps listed for the selected method in the :doc:`matter:nrfconnect_examples_software_update` tutorial of the Matter documentation.

Dependencies
************

This sample uses the Matter library that includes the |NCS| platform integration layer:

* `Matter`_

In addition, the sample uses the following |NCS| components:

* :ref:`dk_buttons_and_leds_readme`

The sample depends on the following Zephyr libraries:

* :ref:`zephyr:logging_api`
* :ref:`zephyr:kernel_api`
