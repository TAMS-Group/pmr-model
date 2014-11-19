use <nutsnbolts/cyl_head_bolt.scad>;

// 7mm ohne Schraubenkopf
magnetRad = 3;
magnetHeight = 2;
nutSize = "M4";
nutHeight = 2.5;
screwSize = "M4x6";
screwDia = 4;
screwHeight = 6;
toleranceScaling = 1.04;
tolerance = 0.25;

mSize = 4;
screwLength = 6;

$fn=50;
 
//busContact_simple();
busContact(magnetRad, magnetHeight, nutSize, nutHeight, screwDia, screwHeight);


module busContact_simple(){
	union(){
		translate([0,0,.5*magnetHeight]) cylinder(r1=magnetRad+tolerance, r2=magnetRad-1+tolerance, h=magnetHeight/2.5);
		cylinder(r=magnetRad+tolerance, h=magnetHeight, center=true);
		translate([0,0,nutHeight+.5*magnetHeight+magnetHeight/2.5]) {
			nutcatch_parallel(nutSize, l=nutHeight, clk=tolerance);
		}
		translate([0,0,6]) screw(screwSize);
	}
}


module busContact(magnetRad, magnetHeight, nutSize, nutHeight, screwDia, screwHeight){
	 union(){
		translate([0,0,magnetHeight]) cylinder(r1=magnetRad+tolerance, r2=screwDia/2+tolerance, h=magnetHeight/2);
		cylinder(r=magnetRad+tolerance, h=magnetHeight, center=false);
		translate([0,0,nutHeight+magnetHeight+magnetHeight/2+(screwLength-(nutHeight+magnetHeight+magnetHeight/2))]) {
			scale([toleranceScaling,toleranceScaling,1]) nutcatch_parallel(nutSize, l=nutHeight, clk=tolerance);
		}
		translate([0,0,7]) myScrew(mSize, screwLength-1);
	}
}


module busContact_withoutNut(magnetRad, magnetHeight, nutSize, nutHeight, screwDia, screwHeight){
	 union(){
		translate([0,0,magnetHeight]) cylinder(r1=magnetRad+tolerance, r2=screwRad+tolerance, h=magnetHeight/2);
		cylinder(r=magnetRad+tolerance, h=magnetHeight, center=false);		
		translate([0,0,6]) myScrew(mSize, screwLength);
	}
}


module myScrew(mSize, length){
	union(){
		cylinder(r=mSize/2*2+tolerance, h=mSize*1.5/2);
		translate([0,0,-length-1]) cylinder(r=mSize/2+tolerance, h=mSize+2);
	}
}