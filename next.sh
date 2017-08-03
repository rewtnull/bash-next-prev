#
# next(${array[@]})
#
# Copyright (C) 2017 Marcus Hoffren <marcus@harikazen.com>.
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
# This is free software: you are free to change and redistribute it.
# There is NO WARRANTY, to the extent permitted by law.
#
# For each function call, returns the next element from input array and wraps to
# the beginning of array when reaching the end. Inspired by the python .next()
# method. Uses five global variables: runcount1, runcount2, statenext, subscript,
# inputarray - Globals are exchanged between next() and prev() functions
#

next() {

    local element x
    runcount2="0"

    [[ "${@}" ]] && subscript="" # if run with argument, start over
    [[ -z "${subscript}" ]] && { inputarray=("${@}"); subscript="0"; } # first run

	[[ ! "${@}" && ${runcount1} == "0" ]] && { (( statenext += 2 )); (( subscript += 2 )); } # every first run without argument given

	[[ ${statenext} -ge ${#inputarray[@]} ]] && { statenext="0"; subscript="0"; } # when reaching the end, jump to beginning
    [[ ${statenext} -eq "" ]] && statenext="0"

    for (( x = ${subscript}; x < ${#inputarray[@]}; x++ )); do
	element="${inputarray[${subscript}]}"
	break
    done

    echo -e "\e[92m${element}\e[0m"

    (( subscript += 1 ))

    statenext="${subscript}"

    runcount1="1"

}
