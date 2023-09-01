#!/bin/bash

#  ^|berpr  fen, ob die erforderlichen Dateien vorhanden sind
if [ ! -e "config.json" ] || [ ! -e "phone" ]; then
  echo "Die Datei 'config.json' oder 'phone' existiert nicht."
  exit 1
fi

# Den Wert aus 'phone' auslesen
phone_wert=$(cat phone)

# Den gesamten Inhalt der 'config.json' in eine Variable lesen
config_inhalt=$(cat config.json)

# Den Wert "phonefarm" in der Zeichenkette suchen und ersetzen
neuer_inhalt=$(echo "$config_inhalt" | sed "s/\(phonefarm[0-9]\)/$phone_wert/g")

# Den aktualisierten Inhalt zur  ck in 'config.json' schreiben
echo "$neuer_inhalt" > config.json

echo "Der Wert 'phonefarm' in 'config.json' wurde erfolgreich durch den Wert aus 'phone' ersetzt."

exit 0
