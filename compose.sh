#!/bin/bash

export BACKENDAPP=istsos;
export FRONTENDAPP=simile;

build=0;
detach=0;
while getopts "hbd" arg; do
  case $arg in
    h)
      echo "Sorry, no help available." ;
      exit 0;
      ;;
    b)
      build=1;
      ;;
    d)
      detach=1;
      ;;
  esac
done

if [ ! -d "./${BACKENDAPP}" ]; then
    git clone https://github.com/gtergeomatica/istsosproxy.git $BACKENDAPP;
    # 
    cp ./settings_private.py $BACKENDAPP/
fi

if [ ! -d "./${FRONTENDAPP}" ]; then
    git clone https://github.com/gtergeomatica/template_progetto_simile.git $FRONTENDAPP;
fi

if [ $build -eq 1 ]; then
    echo "Building"
    docker compose build;
elif [ $detach -eq 1 ]; then
    echo "Detaching"
    docker compose up -d;
else
    echo "Debug"
    docker compose up;
fi;