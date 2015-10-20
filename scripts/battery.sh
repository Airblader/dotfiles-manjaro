#!/usr/bin/env bash

ACPI=$(acpi -b)
STATE=$(echo "${ACPI}" | awk '{ gsub("Unknown","Charging",$3); print $3, $4 }' | tr -d ',')

REMAINING=""
if grep -q "Discharging" <(echo "${STATE}"); then
    REMAINING=$(echo "${ACPI}" | awk -F' ' '{print $5}' | awk -F':' '{print $1":"$2}')
    REMAINING=" (${REMAINING}h)"
fi

echo "${STATE}${REMAINING}"
