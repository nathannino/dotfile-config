#!/bin/bash

printf "==================[  "
date | tr --delete "\n" | xargs -0 printf
printf "  ]=========================================================================\n"
macchina
printf "================================================================================================================================\n"
cal
printf "================================================================================================================================\n"
duf -only local
