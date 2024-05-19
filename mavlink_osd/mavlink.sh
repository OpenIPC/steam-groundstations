#!/usr/bin/python3

from pymavlink import mavutil
import time


# PyMAVLink has an issue that received messages which contain strings
# cannot be resent, because they become Python strings (not bytestrings)
# This converts those messages so your code doesn't crash when
# you try to send the message again.
def fixMAVLinkMessageForForward(msg):
    msg_type = msg.get_type()
    if msg_type in ('PARAM_VALUE', 'PARAM_REQUEST_READ', 'PARAM_SET'):
        if type(msg.param_id) == str:
            msg.param_id = msg.param_id.encode()
    elif msg_type == 'STATUSTEXT':
        if type(msg.text) == str:
            msg.text = msg.text.encode()
    return msg


print(f'Mavlink parsing server running! connecting to UDP localhost:14550')
vehicle = mavutil.mavlink_connection('udpin:localhost:14550')
vehicle.wait_heartbeat()
print(f'Heartbeat from system (system {vehicle.target_system} component {vehicle.target_system})')

while True:

    vcl_msg = vehicle.recv_match(blocking=False)
    if vcl_msg is None:
        pass
    elif vcl_msg.get_type() != 'BAD_DATA':
        # We now have a message we want to forward. Now we need to
        # make it safe to send
        vcl_msg = fixMAVLinkMessageForForward(vcl_msg)

        msgType = vcl_msg.get_type()
        #check type
        #print(vcl_msg.get_type())

        if msgType == 'RC_CHANNELS_RAW':
            print('RC_CHANNELS_RAW')
            print(vcl_msg.chan8_raw)


            #Write chan_8
            file1 = open("chan8_raw", "a")
            file1.write("\n")
            file1.write(str(vcl_msg.chan8_raw))
            file1.close()

            #Write rssi
            file1 = open("rssi", "a")
            file1.write("\n")
            file1.write(str(vcl_msg.rssi))
            file1.close()


        elif msgType == 'RADIO_STATUS':
            print('RADIO_STATUS')

            file1 = open("radio_noise", "a")
            file1.write("\n")
            file1.write(str(vcl_msg.noise))
            file1.close()



        #elif msgType == 'ATTITUDE':
        #    print('ATTITUDE')
        #elif msgType == 'SYS_STATUS':
        #    print('SYS_STATUS')
        #elif msgType == 'RADIO_STATUS':
        #    print('RADIO_STATUS')




        # Finally, in order to forward this, we actually need to
        # hack PyMAVLink so the message has the right source
        # information attached.
        #gcs_conn.mav.srcSystem = vcl_msg.get_srcSystem()
        #gcs_conn.mav.srcComponent = vcl_msg.get_srcComponent()

        print(vcl_msg)

    # Don't abuse the CPU by running the loop at maximum speed
    time.sleep(0.001)
