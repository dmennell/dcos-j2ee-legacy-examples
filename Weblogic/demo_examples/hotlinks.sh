#!/usr/bin/env bash
export MASTER_URL=http://mjohnson-elasticl-qzqutisl66gx-1374233254.us-west-2.elb.amazonaws.com/
export PUBLIC_IP=http://52.27.8.165
open -a Firefox $PUBLIC_IP:9090/haproxy?stats $PUBLIC_IP:10000/sample/ $PUBLIC_IP:10100/benefits/
