magnetHeight = 1.9;
magnetRad = 3.1;

$fn = 50;


module neodymMagnet(magnetRad, magnetHeight){
	translate([0,0,-magnetRad/2]) cylinder(r=magnetRad, h=magnetHeight);
}