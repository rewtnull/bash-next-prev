# bash-next-prev
next() and prev() functions in bash inspired by the python .next() method

next(array) => ${output}

	For each function call, returns the next element from input array and wraps to the beginning of array
	when reaching the end.

	Uses five global variables: runcount1, runcount2, statenext, subscript, inputarray
	- Globals are exchanged between next() and prev() functions

USAGE

	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	next "${alpha[@]}"; echo "${output}" # <a> b c d e f (first run)
	next; echo "${output}"               # a <b> c d e f (next)
	next; echo "${output}"               # a b <c> d e f (next)
	next; echo "${output}"               # a b c <d> e f (next)
	next; echo "${output}"               # a b c d <e> f (next)
	next; echo "${output}"               # a b c d e <f> (next)
	next; echo "${output}"               # <a> b c d e f (next)
	next; echo "${output}"               # a <b> c d e f (next)
	next; echo "${output}"               # a b <c> d e f (next)
	next; echo "${output}"               # a b c <d> e f (next)
	prev; echo "${output}"               # a b <c> d e f (prev)
	prev; echo "${output}"               # a <b> c d e f (prev)
	prev; echo "${output}"               # <a> b c d e f (prev)
	prev; echo "${output}"               # a b c d e <f> (prev)
	next; echo "${output}"               # <a> b c d e f (next)
	next; echo "${output}"               # a <b> c d e f (next)

	The reason I chose to redirect output to ${output} is because trying something like:
	foo="$(next)"; [[ ${foo} != "bar" ]] ... would force next() to run in a subshell, and thus would
	not yield the desired results.

	Here are some usage examples:

	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	for (( i = 0; i < ${#alpha[@]}; i++ )); do

	    if [[ -z ${run} ]]; then
		next "${alpha[@]}"; run="1" # first iteration
	    fi

	    if [[ "${output}" == "d" ]]; then
		echo "Output is ${output}!"
	    else
		echo -e "${output}"
	    fi

	    next
	done; unset i run

	You can also do this:
	
	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	next "${alpha[@]}"; echo "${output}"	# a
	next; echo "${output}"			# b
	next; echo "${output}"			# c
	...

	Or even:
	
	next "${alpha[@]}"
	next
	next
	next
	next
	echo "${output}"	# e

prev(array) => ${output}

	For each function call, returns the previous element from input array and wraps to the end of array
	when reaching the beginning.

	Uses five global variables: runcount1, runcount2, statenext, subscript, inputarray
	- Globals are exchanged between prev() and next() functions

USAGE

	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	prev "${alpha[@]}"; echo ${output} # a b c d e <f> (first run)
	prev; echo ${output}               # a b c d <e> f (prev)
	prev; echo ${output}               # a b c <d> e f (prev)
	prev; echo ${output}               # a b <c> d e f (prev)
	prev; echo ${output}               # a <b> c d e f (prev)
	prev; echo ${output}               # <a> b c d e f (prev)
	prev; echo ${output}               # a b c d e <f> (prev)
	prev; echo ${output}               # a b c d <e> f (prev)
	prev; echo ${output}               # a b c <d> e f (prev)
	prev; echo ${output}               # a b <c> d e f (prev)
	next; echo ${output}               # a b c <d> e f (next)
	next; echo ${output}               # a b c d <e> f (next)
	next; echo ${output}               # a b c d e <f> (next)
	next; echo ${output}               # <a> b c d e f (next)
	prev; echo ${output}               # a b c d e <f> (prev)
	prev; echo ${output}               # a b c d <e> f (prev)

	The reason I chose to redirect output to ${output} is because trying something like:
	foo="$(prev)"; [[ ${foo} != "bar" ]] ... would force prev() to run in a subshell, and thus would
	not yield the desired results.

	Here are some usage examples:

	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	for (( i = 0; i < ${#alpha[@]}; i++ )); do

	    if [[ -z ${run} ]]; then
		prev "${alpha[@]}"; run="1" # first iteration
	    fi

	    if [[ "${output}" == "d" ]]; then
		echo "Output is ${output}!"
	    else
		echo -e "${output}"
	    fi

	    prev
	done; unset i run

	You can also do this:
	
	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	prev "${alpha[@]}"; echo "${output}"	# f
	prev; echo "${output}"			# e
	prev; echo "${output}"			# d
	...

	Or even:
	
	prev "${alpha[@]}"
	prev
	prev
	prev
	prev
	echo "${output}"	# b

AUTHOR

	Written by Marcus Hoffren

	Other projects of mine can be found at https://github.com/rewtnull?tab=repositories

COPYRIGHT

	Copyright © 2017 Marcus Hoffren. License GPLv3+:
	GNU GPL version 3 or later - http://gnu.org/licenses/gpl.html

	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.

