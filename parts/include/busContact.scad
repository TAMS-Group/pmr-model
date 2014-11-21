// negative of the desired bus-contact slots that holds the neodymium magnet and a ferromagnetic screw 
use <../../nutsnbolts/cyl_head_bolt.scad>;

magnetRad = 3;
magnetHeight = 2;
nutSize = "M4";
nutHeight = 2.5;
screwSize = "M4x6";
screwDia = 4;
screwHeight = 6;
toleranceScaling = 1.04;
tolerance = 0.25;

myScrewSize = 4;
screwLength = 6;

$fn=50;
 

busContact(magnetRad, magnetHeight, nutSize, nutHeight, screwDia, screwHeight);


module busContact(magnetRad, magnetHeight, nutSize, nutHeight, screwDia, screwHeight){
	 union(){
		translate([0,0,magnetHeight]) cylinder(r1=magnetRad+tolerance, r2=screwDia/2+tolerance, h=magnetHeight/2);
		cylinder(r=magnetRad+tolerance, h=magnetHeight, center=false);
		translate([0,0,nutHeight+magnetHeight+magnetHeight/2+(screwLength-(nutHeight+magnetHeight+magnetHeight/2))]) {
			scale([toleranceScaling,toleranceScaling,1]) nutcatch_parallel(nutSize, l=nutHeight, clk=tolerance);
		}
		translate([0,0,7]) myScrew(myScrewSize, screwLength-1);
	}
}


module myScrew(myScrewSize, length){
	union(){
		cylinder(r=myScrewSize/2*2+tolerance, h=myScrewSize*1.5/2);
		translate([0,0,-length-1]) cylinder(r=myScrewSize/2+tolerance, h=myScrewSize+2);
	}
}