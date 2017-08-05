# bash-next-prev
next() and prev() functions in bash inspired by the python .next() method

next(${array[@]})

	For each function call, returns the next element from input array and wraps to the beginning of array when
	reaching the end.

	Uses five global variables: runcount1, runcount2, statenext, subscript, inputarray
	- Globals are exchanged between next() and prev() functions

USAGE

	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	next "${alpha[@]}"  # <a> b c d e f (first run)
	next                # a <b> c d e f (next)
	next                # a b <c> d e f (next)
	next                # a b c <d> e f (next)
	next                # a b c d <e> f (next)
	next                # a b c d e <f> (next)
	next                # <a> b c d e f (next)
	next                # a <b> c d e f (next)
	next                # a b <c> d e f (next)
	next                # a b c <d> e f (next)
	prev                # a b <c> d e f (prev)
	prev                # a <b> c d e f (prev)
	prev                # <a> b c d e f (prev)
	prev                # a b c d e <f> (prev)
	next                # <a> b c d e f (next)
	next                # a <b> c d e f (next)

	If you want to run tests against the output, you can comment out line 33 (echo -e ...), and
	reassign the local variable ${element} like so: output="${element}" instead. The reason for
	this is because trying something like: foo="$(next)"; [[ ${foo} != "bar" ]] ... will force
	next() to run in a subshell, and thus will not yield the wanted results.
	
	After doing the above changes you can do this:
	
	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	next "${alpha[@]}" # first run outside of loop

	for (( i = 0; i < ${#alpha[@]}; i++ )); do
		if [[ "${output}" == "d" ]]; then
			echo "Output is ${output}!"
		else
			echo -e "${output}"
		fi

		next
	done

	You can also do this:
	
	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	next "${alpha[@]}"
	echo "${output}"	# a
	next
	echo "${output}"	# b
	next
	echo "${output}"	# c
	...

prev(${array[@]})

	For each function call, returns the previous element from input array and wraps to the end of array when
	reaching the beginning.

	Uses five global variables: runcount1, runcount2, statenext, subscript, inputarray
	- Globals are exchanged between prev() and next() functions

USAGE

	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	prev "${alpha[@]}"  # a b c d e <f> (first run)
	prev                # a b c d <e> f (prev)
	prev                # a b c <d> e f (prev)
	prev                # a b <c> d e f (prev)
	prev                # a <b> c d e f (prev)
	prev                # <a> b c d e f (prev)
	prev                # a b c d e <f> (prev)
	prev                # a b c d <e> f (prev)
	prev                # a b c <d> e f (prev)
	prev                # a b <c> d e f (prev)
	next                # a b c <d> e f (next)
	next                # a b c d <e> f (next)
	next                # a b c d e <f> (next)
	next                # <a> b c d e f (next)
	prev                # a b c d e <f> (prev)
	prev                # a b c d <e> f (prev)

	If you want to run tests against the output, you can comment out line 33 (echo -e ...), and
	reassign the local variable ${element} like so: output="${element}" instead. The reason for
	this is because trying something like: foo="$(prev)"; [[ ${foo} != "bar" ]] ... will force
	prev() to run in a subshell, and thus will not yield the wanted results.
	
	After doing the above changes you can do this:
	
	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	prev "${alpha[@]}" # first run outside of loop

	for (( i = 0; i < ${#alpha[@]}; i++ )); do
		if [[ "${output}" == "d" ]]; then
			echo "Output is ${output}!"
		else
			echo -e "${output}"
		fi

		prev
	done

	You can also do this:
	
	alpha=("a" "b" "c" "d" "e" "f") # initiate array

	prev "${alpha[@]}"
	echo "${output}"	# f
	prev
	echo "${output}"	# e
	prev
	echo "${output}"	# d
	...

AUTHOR

	Written by Marcus Hoffren

REPORTING BUGS

	Report gch.sh bugs to marcus@harikazen.com
	Updates of gch.sh and other projects of mine can be found at
	https://github.com/rewtnull?tab=repositories

COPYRIGHT

	Copyright © 2017 Marcus Hoffren. License GPLv3+:
	GNU GPL version 3 or later - http://gnu.org/licenses/gpl.html

	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.

