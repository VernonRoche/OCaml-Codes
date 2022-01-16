La requete type permet de donner un nom a un type compose a l'aide d'operateurs de type:
1)-> pour construire un type fonction 
type fonction_unitaire_entiere= int -> int

2)* pour un produit cartesien de type
int*int*int : un triplet d'entier
type int_triplets= int*int*int
type fonction.couples.entiers= int*int->int*int

3)"Types somme"
type trafficlights= Red | Green | Orange
la barre vertical indique une union, le type trafficlights est l'union de Red, Green, Orange. Red,Green et Orange sont les constructeurs du type trafficlights et leurs noms doit commencer par une majuscule.
Syntaxe generale:  type nom = Nom1 | Nom2 | Nom3 | Nom4 |.....
une variable de type trafficlights pourra etre au choix: Red, Green, Orange.

"Types somme" avec des constructeurs parametrer: Example: un type "num" qui puisse etre au choix un entier ou un flottant.
type num = Entier of int | Reel of float
Syntaxe generale: type nom= Nom1 of type1 | Nom2 of type2 |....    ou type1 peut etre un type de base, un type fonction(avec ->), un type produit cartesien(avec *)
Example: type fonction_num_unitaire= Fonction_entiere of (int->int) | Fonction_reel of (float->float)
type num_couple= Int_pair of int*int | Float_pair of double*double

On peut avoir dans un meme type des constructeurs avec parametres et d'autres sans parametres:
type int_or_infinity= Int of int | Infinity 

let div n d=
	if d=0 then
		if n=0 then failwith "undefined form 0/0"
		else Infinity
	else Int(n/d)

Le type de la fonction div est: int->int->int_or_infinity

Example: type form= Square of  int| Circle of int | Rectangle of int*int 
let r= Rectangle(8,10);;
let c=Circle(3);;

La construction match.....with
Cette construction permet de faire un filtrage sur les constructeurs d'un type somme
let permettre f= match f with
|Square (c)-> 4.*. float_of_int(c)
|Circle (r)-> 2.*.3.14*.float_of_int(r)
|Rectangle (l,h)-> 2.*.float_of_int(l)*.float_of_int(h)

Syntaxe generale du filtrage
match nom_var with
|motf1 -> expr1
ou
|Constructeur (param1,param2,..)-> expr2   (contructeur defini avant)
Il y a la creation des variables locales utilisee dans le match et liaison avec les valeurs de nom_var
2 versions:
let pair_somme p1 p2= let(x1,y1)=p1 in
	let (x2,y2)=p2 in
		(x1+x2,y1+y2)
		
		
let pair_somme p1 p2=
match p1,p2 with
|(x1,y1),(x2,y2)->(x1+x2,y1+y2)




Exo Feuille TD
3.1
type de fun x y->(x,y) 'a->'b->'a*'b

3.3
type couleur=
	Pique|Coeur|Carreau|Treffle;;
type carte=
	As of couleur |Roi of couleur |Dame of couleur|Valet of couleur|Numero of int*couleur
	
let est_une_figure carte=
	match carte with
	|Roi(_)->true
	|Dame(_)->true
	|Valet(_)->true
	|_->false;;
	
let est_une_figure carte couleur=
match carte with
|As(c)|Roi(c)|Dame(c)|Valet(c)|Numero(_,c) -> c=couleur

3.4
type carburant= Diesel|Essence|Electrique;;

type vehicule= V of int * carburant;;

let peut_rouler vehicule=
match vehicule with
|V(r,carburant)-> not(r>=4 && carburant=Diesel)

let consommation vehicule n=
match vehicule with
|V(_,Diesel)->((float_of_int(n)*.6.0)/.100.0)*.1.5
|V(_,Essence)->((float_of_int(n)*.8.0)/.100.0)*.1.5
|V(_,Electrique)->((float_of_int(n)*.10.0)/.100.0)*.0.25
























