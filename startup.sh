#!/bin/bash

# Start code-server
code-server \
  --bind-addr 0.0.0.0:8080 \
  --auth password \
  --disable-telemetry \
  /workspace
