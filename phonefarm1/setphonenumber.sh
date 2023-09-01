#!/bin/bash

# Überprüfen, ob die erforderlichen Dateien vorhanden sind
if [ ! -e "config.json" ] || [ ! -e "phone" ]; then
  echo "Die Datei 'config.json' oder 'phone' existiert nicht."
  exit 1
fi

# Den Wert in 'config.json' finden, dessen letzte Stelle eine zufällige Zahl ist
zufalls_wert=$(jq -r 'to_entries | .[] | select(.value | test(".*[0-9]$")) | .value' config.json)

# Den Wert aus 'phone' auslesen
phone_wert=$(cat phone)

# Die zufällige Zahl am Ende des Werts in 'config.json' ersetzen
neuer_wert=$(echo "$zufalls_wert" | sed "s/[0-9]\$/$phone_wert/")

# Den neuen Wert in 'config.json' aktualisieren
jq --argjson neuer_wert "$neuer_wert" '.[] |= gsub($neuer_wert)' config.json > tmp_config.json
mv tmp_config.json config.json

echo "Der Wert in 'config.json' mit einer zufälligen Zahl am Ende wurde erfolgreich durch den Wert aus 'phone' ersetzt."

exit 0
