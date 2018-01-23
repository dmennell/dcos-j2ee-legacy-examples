#!/usr/bin/env bash
docker build -f Wildfly-Dockerfile -t markfjohnson/wildfly .
docker push markfjohnson/wildfly
