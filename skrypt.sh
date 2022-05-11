#!/bin/bash
function Help()
{
   echo
   echo "skrypt.sh"
   echo
   echo "Dostępne opcje:"
   echo "--help | -h	Wyświetla listę poleceń."
   echo "--date | -d	Wyświetla dzisiejszą datę."
   echo "--logs | -l [x]	Tworzy x plików log. (Domyślnie 100)"
   echo "--error | -e [x]	Tworzy x plików error. (Domyślnie 100)"
   echo "--init | -i	Klonuje repozytorium do folderu."
   echo
}

function CreateLogs()
{
   if [[ $LOGS == "" ]]; then
      LOGS=100
   fi
   for ((i = 1; i <= $LOGS; i++)); do
      echo "Tworzę log nr "$i
      mkdir log$i
      echo "log"$i".txt" >> log$i/log$i.txt
      echo "$0" >> log$i/log$i.txt
      date >> log$i/log$i.txt
   done
}

function CreateErrors()
{
   if [[ $ERRORS == "" ]]; then
      ERRORS=100
   fi
   for ((i = 1; i <= $ERRORS; i++)); do
      echo "Tworzę error nr "$i
      mkdir error$i
      echo "error"$i".txt" >> error$i/error$i.txt
      echo "$0" >> error$i/error$i.txt
      date >> error$i/error$i.txt
   done
}

function Init()
{
   git clone git@github.com:Michal-GK/Lab4.git .
   export PATH=$PATH:.
}

if [ $# -eq 0 ]; then
    Help
    exit 1
fi

LOGS=
ERRORS=

while [ "$1" != "" ]; do
    case $1 in
    -h | --help)
        Help
        ;;
    -d | --date)
        date
        ;;
    -l | --logs)
        shift 
        LOGS=$1
        CreateLogs
        ;;
    -e | --error)
        shift 
        ERRORS=$1
        CreateErrors
        ;;
    -i | --init)
        Init
        ;;
    *)
        echo "Błąd, niepoprawne parametry"
        exit 1
        ;;
    esac
    shift
done


