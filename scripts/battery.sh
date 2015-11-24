#!/usr/bin/env bash

ACPI=$(acpi -b)
CHARGE=$(echo -n "${ACPI}" | egrep -o "[0-9]+%" | sed -e "s,%,,g")

STATE=""
if grep -q "Charging\|Full" <(echo "${ACPI}" | awk '{ gsub("Unknown","Charging",$3); print $3}'); then
    STATE=""
else
    STATE=$(echo "${ACPI}" | awk -F' ' '{print $5}' | awk -F':' '{print $1":"$2}')
    STATE=" (${STATE}h)"
fi

LEVEL=$(( (CHARGE - 1) / 20 ))
ICON="f$(( 244 - LEVEL ))"

echo -e "  \u${ICON}  ${CHARGE}${STATE} "

[[ "${LEVEL}" = "0" ]] && {
    [[ -z "${STATE}" ]] || i3-msg "fullscreen disable"
    exit 33
}

exit 0
