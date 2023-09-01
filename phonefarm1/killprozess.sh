#!/bin/bash

# ueberprüfen, ob der Benutzer den Prozessnamen angegeben hat
if [ $# -ne 1 ]; then
  echo "Bitte geben Sie den Namen des Prozesses an, den Sie beenden moechten."
  exit 1
fi

# Den Prozess anhand des Namens finden und beenden
prozessname=$1
prozessid=$(pgrep "$prozessname")

if [ -z "$prozessid" ]; then
  echo "Prozess '$prozessname' wurde nicht gefunden."
else
  echo "Beende Prozess '$prozessname' (Prozess-ID: $prozessid)."
  kill "$prozessid"
fi

exit 0
