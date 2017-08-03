#
# prev(${array[@]})
#
# Copyright (C) 2017 Marcus Hoffren <marcus@harikazen.com>.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
#
# For each function call, returns the previous element from input array and wraps
# to the end of array when reaching the beginning. Inspired by the python .next()
# method, but in reverse. Uses five global variables: runcount1, runcount2,
# statenext, subscript, inputarray - Globals are exchanged between prev() and
# next() functions

prev() {

    local element x
    runcount1="0"

    [[ "${@}" ]] && subscript="" # if run with argument, start over
    [[ -z "${subscript}" ]] && { inputarray=("${@}"); subscript="-1"; statenext="-1"; } # first run

    [[ ! "${@}" && ${runcount2} == "0" ]] && { (( statenext -= 2 )); (( subscript -= 2 )); } # every first run without argument given

    [[ ${statenext} -lt -${#inputarray[@]} ]] && { statenext="-1"; subscript="-1"; } # when reaching the end, jump to beginning
    [[ ${statenext} -eq "" ]] && statenext="-1"

    for (( x = ${#inputarray[@]}; ${#inputarray[@]} > ${subscript}; x-- )); do
	element="${inputarray[${subscript}]}"
	break
    done

    echo -e "\e[91m${element}\e[0m"

    (( subscript -= 1 ))

    statenext="${subscript}"

    runcount2="1"

}
