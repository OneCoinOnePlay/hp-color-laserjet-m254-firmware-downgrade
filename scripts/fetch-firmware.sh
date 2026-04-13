#!/usr/bin/env bash

set -euo pipefail

ARCHIVE_URL="https://web.archive.org/web/20201110124329/http://ftp.hp.com/pub/networking/software/pfirmware/HP_Color_Laser_Jet_Pro_M254_dw_Printer_series_20200612.rfu"
OUTPUT_DIR="firmware"
OUTPUT_FILE="${OUTPUT_DIR}/HP_Color_Laser_Jet_Pro_M254_dw_Printer_series_20200612.rfu"

mkdir -p "${OUTPUT_DIR}"

if [ -f "${OUTPUT_FILE}" ]; then
  printf 'Firmware already exists at %s\n' "${OUTPUT_FILE}"
  exit 0
fi

printf 'Downloading firmware to %s\n' "${OUTPUT_FILE}"
curl -fL "${ARCHIVE_URL}" -o "${OUTPUT_FILE}"
printf 'Done.\n'
