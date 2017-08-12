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

	If you want to run tests against the output, you can change line 33 (echo -e ...) to:
	output="${element}" instead. The reason for this is because trying something like:
	foo="$(next)"; [[ ${foo} != "bar" ]] ... will force next() to run in a subshell, and
	thus will not yield the desired results.
	
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

	Or even:
	
	next "${alpha[@]}"
	next
	next
	next
	next
	echo "${output}"	# e

	You could also do something a bit more complex such as:

	alpha=("a" "b" "c" "d" "e" "f" "g" "h")
	run="0"

	for (( i = 0; i < ${#alpha[@]}; i++ )); do
		for (( j = 0; j < ${#alpha[@]}; j++ )); do
			if [[ ${run} == "0" ]]; then
				next "${alpha[@]}"
				echo -n "${output} "
				run="1"
			else
				next
				echo -n "${output} "
			fi
		done
		next
		echo ""
	done

	which would output:

	a b c d e f g h 
	b c d e f g h a 
	c d e f g h a b 
	d e f g h a b c 
	e f g h a b c d 
	f g h a b c d e 
	g h a b c d e f 
	h a b c d e f g

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

	If you want to run tests against the output, you can change line 33 (echo -e ...) to:
	output="${element}" instead. The reason for this is because trying something like:
	foo="$(prev)"; [[ ${foo} != "bar" ]] ... will force prev() to run in a subshell, and
	thus will not yield the desired results.
	
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

	Or even:
	
	prev "${alpha[@]}"
	prev
	prev
	prev
	prev
	echo "${output}"	# b

	You could also do something a bit more complex such as:

	alpha=("a" "b" "c" "d" "e" "f" "g" "h")
	run="0"

	for (( i = 0; i < ${#alpha[@]}; i++ )); do
		for (( j = 0; j < ${#alpha[@]}; j++ )); do
			if [[ ${run} == "0" ]]; then
				prev "${alpha[@]}"
				echo -n "${output} "
				run="1"
			else
				prev
				echo -n "${output} "
			fi
		done
		prev
		echo ""
	done

	which would output:

	h g f e d c b a 
	g f e d c b a h 
	f e d c b a h g 
	e d c b a h g f 
	d c b a h g f e 
	c b a h g f e d 
	b a h g f e d c 
	a h g f e d c b

AUTHOR

	Written by Marcus Hoffren

	Other projects of mine can be found at https://github.com/rewtnull?tab=repositories

COPYRIGHT

	Copyright © 2017 Marcus Hoffren. License GPLv3+:
	GNU GPL version 3 or later - http://gnu.org/licenses/gpl.html

	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.

