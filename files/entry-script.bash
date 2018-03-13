#!/bin/bash


trap_TERM() {
  echo 'SIGTERM ACCEPTED.'
  exit 0
}
trap 'trap_TERM' TERM

while :
do
  sleep 5
done
