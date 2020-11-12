#!/bin/bash

export URL=http://www.google.com
locust -f src/scripts/test.py --no-web -H $URL -c 3 -r 3