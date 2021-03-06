type complex=C of float*float

(*4.3*)
let nowhere (C(x,y))=false

let everywhere (C(x,y))=true

let point_in_zone_p point zone= zone point

(*4.4*)
fun make_rectangle width height-> fun (C(x,y))-> 
if x>=width && y>=height && x>=0. && y>=0. then true
else false


fun zone_union zone1 zone2-> fun (C(x,y)) -> 
if zone1 (C(x,y))=true || zone2 (C(x,y))=true then true
else false


fun zone_complement zone1-> fun (C(x,y))->
if zone1 (C(x,y))=true then false
else true



fun zone_intersection zone1 zone2-> fun (C(x,y)) -> 
if zone1 (C(x,y))=true && zone2 (C(x,y))=true then true
else false



(*4.5*)
fun make_disk0 radius-> fun (C(x,y)) -> cos(x)<=cos(radius) && sin(y)<=sin(radius) && sin(x)<=sin(radius) && cos(y)<=cos(radius)

(*4.6*)
fun scale_zone0 zone (C(a,b))  -> fun (C(x,y)) -> (C(a*.x,b*.y))
