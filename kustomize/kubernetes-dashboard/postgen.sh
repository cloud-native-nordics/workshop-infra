#!/bin/bash

sed -e 's|kubernetes.io/cluster-service: "true"||g' -i $1
