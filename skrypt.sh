#!/bin/bash
function Help()
{
   echo
   echo "skrypt.sh"
   echo
   echo "Dostępne opcje:"
   echo "--help	Wyświetla listę poleceń."
   echo "--date	Wyświetla dzisiejszą datę."
   echo "--logs [x]        Tworzy x plików log. (Domyślnie 100)"
   echo
}

function CreateLogs()
{
   if [[ $LOGS == "" ]]; then
      LOGS=100
   fi
   for ((i = 1; i <= $LOGS; i++)); do
      echo "Tworzę log nr "$i
      echo "log"$i".txt" >> log$i.txt
      echo "$0" >> log$i.txt
      date >> log$i.txt
   done
}

if [ $# -eq 0 ]; then
    Help
    exit 1
fi

LOGS=

while [ "$1" != "" ]; do
    case $1 in
    --help)
        Help
        ;;
    --date)
        date
        ;;
    --logs)
        shift 
        LOGS=$1
        CreateLogs
        ;;
    *)
        echo "Błąd, niepoprawne parametry"
        exit 1
        ;;
    esac
    shift
done


