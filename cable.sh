#!/bin/bash
echo ' '
echo 'Ensure the leads are connected as follows'
echo ' _______________ '
echo '|R*BWG*******...|'
echo '|************...|'
echo '|...............|'
echo '|_______________|'
echo is this correct?
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo screen /dev/ttyUSB0 115200; break;;
        No ) exit;;
    esac
done
