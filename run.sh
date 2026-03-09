#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

cd "${SCRIPT_DIR}"
CHANNELS_UID=$(id -u plex) CHANNELS_GID=$(id -g plex) docker compose up -d
timeout 2 tail -f ./data/channels-dvr.log
