(****************************)
(* Part 1: Simple Functions *)
(****************************)

let mult_of_y x y = 
	if y = 0 then false
	else x mod y = 0 

let head_divisor lst = 
	match lst with
		|[] -> false
		|[a] -> false
		|a::b::_ -> (mult_of_y a b) 

let second_element lst = 
	match lst with
		|[] -> -1
		|[a] -> -1
		|_::b::_ -> b

let sum_first_three lst = 
	match lst with
		|[] -> 0
		|[a] -> a
		|[a;b] -> (a + b) 
		|a::b::c::_ -> (a + b + c)

(************************************)
(* Part 2: Recursive List Functions *)
(************************************)


let rec get_val i lst = 
	match lst with
		|[] -> -1 
		|h::t-> 
			if i = 0 then h
			else (get_val (i-1) t)

let rec get_vals is lst = 
	match is with
		|[] -> []
		|h::t->  (get_val h lst) :: (get_vals t lst) 

let rec list_swap_val lst x y = 
	match lst with
		|[] -> [] 
		|h::t-> 
			if x = h then y :: (list_swap_val t x y)
		else if y = h then x :: (list_swap_val t x y)
		    else h :: (list_swap_val t x y)

let rec unzip_x lst = 
		match lst with
		|[] -> [] 
		|(x,_)::t-> x :: (unzip_x t)

let rec unzip_y lst = 
		match lst with
		|[] -> [] 
		|(_,y)::t-> y :: (unzip_y t)

let rec unzip lst = (unzip_x lst, unzip_y lst)

let rec index_help x lst curr = 
	match lst with
		|[] -> -1
		|h::t->  
		if x = h then curr
		else (index_help x t (curr + 1))

let rec index x lst = 
	index_help x lst 0

(****************)
(* Part 3: Sets *)
(****************)

let rec insert x a = 
	match a with
		|[] -> x :: []
		|h::t -> 
		if h = x then a
		else if h > x then  x :: h :: t
		else h :: (insert x t)

let rec eq a b =
	match a, b with
	|[], [] -> true
	| [], _ -> false
	| _, [] -> false
	|h::t, i::u -> h = i && (eq t u) 
		
let rec card a = 
	match a with
		|[] -> 0
		|h::t -> 1 + (card t) 

let rec elem x a = 
	match a with
	|[] -> false
	|h::t ->
		if x = h then true
		else (elem x t) 

let rec remove x a = 
	match a with
	|[] -> []
	|h::t -> 
		if x = h then t
		else h :: (remove x t)

	
let rec union a b = 
	match a with
	|[] -> b
	|h::t -> union t (insert h b) 

let rec intersection a b = 
	match a with
	|[] -> []
	|h::t -> if elem h b then h :: (intersection t b)
			else (intersection t b)

let rec subset a b = 
	match a with
	|[] -> true
	|h::t -> if (elem h b) = false then false 
	 else (subset t b)
