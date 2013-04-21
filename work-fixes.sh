#!/bin/bash

echo "Acquire::http::Pipeline-Depth \"0\";" > /etc/apt/apt.conf.d/99http
