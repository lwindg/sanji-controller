#!/bin/sh

source testcase_config

###################################################
# Test Items:
#	1. Test routing procedure of write-like request.
###################################################

# register
${PUB_TOOL} -t "${TOPIC_REGISTER}" -f ${JSON_CONTEXT}/register/request_create_model_eth1.json
${PUB_TOOL} -t "${TOPIC_REGISTER}" -f ${JSON_CONTEXT}/register/request_create_model_wlan1.json
${PUB_TOOL} -t "${TOPIC_REGISTER}" -f ${JSON_CONTEXT}/register/request_create_model_dhcp.json
${PUB_TOOL} -t "${TOPIC_REGISTER}" -f ${JSON_CONTEXT}/register/request_create_model_ipsec.json
${PUB_TOOL} -t "${TOPIC_REGISTER}" -f ${JSON_CONTEXT}/register/request_create_view_veth1.json

# write
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/request_write_eth1.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_write_eth1-succ-eth1.json
sleep 1
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_write_eth1-succ-dhcp.json
${PUB_TOOL} -t "${TOPIC_CONTROLLER}" -f ${JSON_CONTEXT}/response_write_eth1-succ-ipsec.json

