# Bidirectional mavlink over ELRS
For OpenIPC applications

## Overview
Mavfwd and the established mavlink setup works well when using a flightcontroller(FC) to connect to an compatible OpenIPC FPV board like ssc338q or ssc30kq. This is used both for On screen display (OSD) functionality and to send commands to the OpenIPC system, for example to change resolution, bitrate or datalink options.
But if there is no flightcontroller to send mavlink data there can be no control of the OpenIPC board or OSD (at this moment at least).
This is where a recent development project mavlink-rc (https://github.com/ExpressLRS/Docs/pull/394) becomes interesting.
It promises bi-directional mavlink over a standard ELRS link, which becomes even more useful if yopu are using INAV or Ardupilot software.
In my setup I used a Radiomaster Boxer (TX+backpack), Radiomaster ER6 PWM reciever (RX) and ssc30kq (OpenIPC FPV system).

## How to install
Compared to OpenIPC complexity it will be easy for most people, but it involves flashing your TX and RX units with the "master" branch i.e. beta branch of ELRS. It also requires you at the moment to update your TX ELRS backpack with a custom esp8266 firmare (https://ardupilot.org/copter/docs/common-esp8266-telemetry.html).
There is also a good discord channel called "ExpressLRS Community", which houses the group "#mavlink-rc" for some added context.
It took me 2-3hours from start to finish to get mavlink data on my ssc30kq, but your milage may vary.

## Things to be aware of
You need tipomans updated "mavfwd". This is standard on ssc338q but not on ssc30kq. Change baudrate to 460800 and make sure you enable all relevant telemetry/datalink/mavlink options.
When the ELRS people write "you need to change the baud to 460", they actually mean 460800. Well its obvious now.
