# bash-next-prev
next() and prev() functions in bash inspired by the python .next() method

next(${array[@]})

	For each function call, returns the next element from input array and wraps to the beginning of array when
	reaching the end.
	
	Inspired by the python .next() method.
	
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
	next                # a <b> c d e f (next)
	next                # a b <c> d e f (next)



prev(${array[@]})

	For each function call, returns the previous element from input array and wraps to the end of array when
	reaching the beginning.
	
	Inspired by the python .next() method, but in reverse.
	
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
	prev                # a b c d <e> f (prev)
	prev                # a b c <d> e f (prev)

