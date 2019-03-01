# OCaml Warmup

Introduction
------------

The goal of this project is to get familiar with programming in OCaml. I will have to write a number of small functions, each of which is specified in three sections below. 

Project Files
-------------

The following are the relevant files:

  - **basics.ml**: This is where I write my code for all parts of the project.
  - **basics.mli**: This file is used to describe the signature of all the functions in the module. 
  - **public.ml**: This file contains all of the public test cases.

  - **Makefile**: This is used to build the public tests by simply running the command `make`.

Part 1: Simple Functions
------------------------

#### mult_of_y x y
- **Type**: `int -> int -> bool`
- **Description**: Returns `true` if `x` is a multiple of `y`, `false` otherwise.
- **Examples:**
```
mult_of_y 5 10 = false 
mult_of_y 0 10 = true
mult_of_y 15 0 = false
mult_of_y 10 10 = true
mult_of_y 20 10 = true
```

#### head_divisor lst
- **Type**: `int list -> bool`
- **Description**: Returns true if the second element of `lst` divides the head of `lst`, false otherwise.
- **Examples:**
```
head_divisor [] = false
head_divisor [1] = false
head_divisor [10; 5] = true
head_divisor [4; 2; 7] = true
head_divisor [9; 18] = false
```

#### second_element lst
- **Type**: `int list -> int`
- **Description**: Returns the second element of `lst`, or -1 if `lst` has less than 2 elements.
- **Examples:**
```
second_element [] = -1
second_element [1] = -1
second_element [4; 2] = 2
second_element [4; 6; 9] = 6
```

#### sum_first_three lst
- **Type**: `int list -> int`
- **Description**: Returns the sum of the first three elements of `lst`, or the sum of all elements if `lst` has less than 3 elements.
- **Examples:**
```
sum_first_three [] = 0
sum_first_three [5] = 5
sum_first_three [5; 6] = 11
sum_first_three [4; -3; 0] = 1
sum_first_three [1; 1; 1; 7] = 3
```

Part 2: Recursive List Functions
--------------------------------
The following list functions will require recursion to complete. I include the `rec` keyword in function definition to make use of recursion or I will get an unbound value error.

#### get_val i lst
- **Type**: `int -> int list -> int`
- **Description**: Returns the element at index `i` (0-indexed) of `lst`, or -1 if `i` is not a valid index for `lst`.
- **Examples:**
```
get_val 1 [5;6;7;3] = 6 
get_val 4 [5;6;7;3] = -1
get_val (-1) [6;5;7;8] = -1
```

#### get_vals is lst
- **Type**: `int list -> int list -> int list`
- **Description**: Returns a list where the values correspond to the items found at each index of `lst` listed in `is`, or -1 for each out of bound index.
- **Examples:**
```
get_vals [2;0] [5;6;7;3] = [7;5] 
get_vals [2;4] [5;6;7;3] = [7;-1]
get_vals [] [5;6;7;3] = []
```

#### list_swap_val lst x y
- **Type**: `'a list -> 'a -> 'a -> 'a list`
- **Description**: Returns `lst` but with each instance of `x` replaced with `y` and vice versa.
- **Examples:**
```
list_swap_val ['a';'a';'b';'c';'d'] 'a' 'd' = ['d';'d';'b';'c';'a']
list_swap_val [5;6;3] 7 5 = [7;6;3]
list_swap_val [3;2;1] 8 9 = [3;2;1]
list_swap_val [] 5 7 = []
```

#### unzip lst
- **Type**: `('a * 'b) list -> 'a list * 'b list`
- **Description**: Given a list of pairs, returns a pair of lists with the elements in the same order.
- **Examples:**
```
unzip [(1,2);(3,4)] = ([1;3], [2;4])
unzip [] = ([], [])
```

#### index x lst
- **Type**: `'a -> 'a list -> int`
- **Description**: Returns the leftmost index (0-indexed) of element `x` in `lst`, or -1 if no occurrence is found.
- **Examples:**
```
index 1 [1;2] = 0 
index "bat" ["apple";"bat";"bat";"door"] = 1
index 5 [1;2;3] = -1
```

Part 3: Set Implementation using Lists
--------------------------------------

#### insert x a
- **Type**: `'a -> 'a list -> 'a list`
- **Description**: Inserts `x` into the set `a`.
- **Examples:**
```
insert 2 []
insert 3 (insert 2 [])
insert 3 (insert 3 (insert 2 []))
```

#### eq a b
- **Type**: `'a list -> 'a list -> bool`
- **Description**: Returns true iff `a` and `b` are equal as sets - i.e., `x` is an element of `a` iff `x` is an element of `b`.
- **Examples:**
```
eq [] (insert 2 []) = false
eq (insert 2 (insert 3 [])) (insert 3 []) = false
eq (insert 3 (insert 2 [])) (insert 2 (insert 3 [])) = true
```

#### card a
- **Type**: `'a list -> int`
- **Description**: Returns the cardinality of the set `a` - i.e., the number of elements in the set.
- **Examples:**
```
card [] = 0
card (insert 2 (insert 2 [])) = 1
card (insert 2 (insert 3 [])) = 2
```

#### elem x a
- **Type**: `'a -> 'a list -> bool`
- **Description**: Returns true iff `x`is an element of the set `a`.
- **Examples:**
```
elem 2 [] = false
elem 3 (insert 5 (insert 3 (insert 2 []))) = true
elem 4 (insert 3 (insert 2 (insert 5 []))) = false
```

#### remove x a
- **Type**: `'a -> 'a list -> 'a list`
- **Description**: Removes `x` from the set `a`.
- **Examples:**
```
card (remove 3 (insert 5 (insert 3 []))) = 1
elem 3 (remove 3 (insert 2 (insert 3 []))) = false
eq (remove 3 (insert 5 (insert 3 []))) (insert 5 []) = true
```

#### union a b
- **Type**: `'a list -> 'a list -> 'a list`
- **Description**: Returns the union of the sets `a` and `b` - i.e., `x` is an element of `union a b` iff `x` is an element of `a` or `x` is an element of `b`.
- **Examples:**
```
eq (union [] (insert 2 (insert 3 []))) (insert 3 (insert 2 [])) = true
eq (union (insert 5 (insert 2 [])) (insert 2 (insert 5 (insert 3 [])))) (insert 3 (insert 2 (insert 5 []))) = true
eq (union (insert 2 (insert 7 [])) (insert 3 (insert 5 []))) (insert 5 (insert 3 (insert 7 (insert 2 [])))) = true
```

#### intersection a b
- **Type**: `'a list -> 'a list -> 'a list`
- **Description**: Returns the intersection of sets `a` and `b` - i.e., `x` is an element of `intersection a b` iff `x` is an element of `a` and `x` is an element of `b`.
- **Examples:**
```
eq (intersection (insert 3 (insert 5 (insert 2 []))) []) [] = true
eq (intersection (insert 5 (insert 7 (insert 3 (insert 2 [])))) (insert 6 (insert 4 []))) [] = true
eq (intersection (insert 3 (insert 5 (insert 2 []))) (insert 4 (insert 3 (insert 5 [])))) (insert 5 (insert 3 [])) = true
```

#### subset a b
- **Type**: `'a list -> 'a list -> bool`
- **Description**: Return true iff `a` is a subset of `b` - i.e., `x` is an element of `a` implies `x` is an element of `b`.
- **Examples:**
```
subset (insert 2 (insert 4 [])) [] = false
subset (insert 5 (insert 3 [])) (insert 3 (insert 5 (insert 2 []))) = true
subset (insert 5 (insert 3 (insert 2 []))) (insert 5 (insert 3 [])) = false
```

<!-- These should always be left alone or at least updated -->
[pervasives doc]: https://caml.inria.fr/pub/docs/manual-ocaml/libref/Pervasives.html
[git instructions]: ../git_cheatsheet.md
