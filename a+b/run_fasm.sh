#!/bin/bash


rm main
fasm ab.asm
ld ab.o -o main
chmod +x main
rm ab.o
./main
