$fn = 50;

neodymMagnet(2,1);

module neodymMagnet(rad, height){
	translate([0,0,-height/2]) cylinder(r=rad, h=height);
}