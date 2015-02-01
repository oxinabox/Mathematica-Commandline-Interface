#!/bin/bash
PROG="../8.0/Executables/math" 

#Set this to the path to the normal commandline mathematica exectutable. Path is relitive to the location of this script

cd "$( dirname "${BASH_SOURCE[0]}" )"


SHOW_X_VISUALS=true

while getopts ":x" opt; do
    case $opt in
        x) SHOW_X_VISUALS=false ;;
    esac
    
done

#Check if X is functional
xdriinfo > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "No X display. X display features disabled"
    SHOW_X_VISUALS=false
fi

#----------------- Start the program with given settings

RLWRAP_ARGS="-f ./word_comps.dict -pgreen" 

if $SHOW_X_VISUALS; then
    RLWRAP_ARGS="$RLWRAP_ARGS -z ./pipe_graphics.filter"

    #TODO: replace this (Or suppliment with a addional option)
    #with a argument to math that causes it to run
    # <<JavaGraphics as soon as it starts
    # JavaGraphis is smart and watchs the graphics being produced once started.
else
    echo "Showing of visuals using X disabled"
fi
echo "---"

COMMAND="rlwrap $RLWRAP_ARGS $PROG"
exec $COMMAND
