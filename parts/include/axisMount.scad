rad1 = 2.3;
rad2 = 3.5;
rad3 = 3.9;
height1 = 2.4;
height2 = 6;

$fn = 50;

axisMount();

module axisMount(){
	difference(){
		union(){
			hull(){
				cylinder(r=rad2, h=height1);				
				translate([23-rad1-rad2,0,0]){
					cylinder(r=rad1, h=height1);
				}
			}
			translate([0,0,-1]){
				cylinder(r=rad3, h=height2);
			}
		}
	}
}

