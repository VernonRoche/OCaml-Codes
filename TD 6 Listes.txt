Exo 5.2

type peano=Zero|S of peano

let rec add x y=
match x with
Zero->y
| S (x') -> S(add x' y)

let rec mul x y=
match x,y with
|Zero->Zero
|S (x') -> (add (mul x' y) y)               y*x'+y


let rec int_of_peano x=
match x with
Zero->0
|S (x') -> 1+(int_of_peano x')


let rec peano_of_int n=
if n=0 then Zero
else S(peano_of_int (n-1))

-------------------------------------------------------------

type 'a mylist=
Nil
|C of 'a*'a mylist

En OCaml les listes sont predefinies:
[] liste vide
x::l' liste avec x en tete et reste l'

example: fonction
longueur:
let rec len l=
match l with
Nil->0
|C(a,tail)->1+(len tail)


let rec len2 l=
match l with
[]->0
|a::tail->1+(len2 tail)



Exo 6.1
1)
let rec map f l=
match l with
[]->[]
|a::tail->(f a)::(map f tail)


let rec filter p l=
match l with
[]->[]
|pr::fin->f p pr then pr::filter p fin
else filter p fin

2)
let rec list_of_mylist l=
match l with
Nil->[]
|C(a,r)->a::list_of_mylist r


let rec mylist_of_list l=
match l with
[]->Nil
|a::r->C(a,mylist_of_list r)




Exo 6.2
1)
let repeter x k= if (k<0) then failwith "entier negatif" else
match k with
0->[]
|_->x::(repeter x (k-1))
2)
'a->int->'a list


Exo 6.3
1)
let rec iota_r n= if (n<0) then failwith "entier negatif" else
match n with
0->[]
|_->n::(iota_r (n-1))


Exo 6.4
1)
let rec longueur l=
match l with
[]->[]
|































