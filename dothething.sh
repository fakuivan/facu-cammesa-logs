#!/usr/bin/env bash

min() {
    printf "%s\n" "$@" | sort | head -n1
}

LOGS_DIR="./logs"
NAMES=( "datosDemandasPreDes__ChtDemandaArea5Min_1002__$(date +%Y-%m-%d_%H-%M-%S).svg" );
URLS=( "https://aplic.cammesa.com/complemento-portal/descargar?type=csv&value=ChtDemandaArea5Min_1002.xml&header=datosDemandasPreDes" );

ELEMENTS="$(min "${#NAMES[@]}" "${#URLS[@]}")"
for ((i=0; i<ELEMENTS; i++)); do
    wget "${URLS[$i]}" -O "$LOGS_DIR/${NAMES[$i]}" || exit 1;
done
