width = 13.5;
length = 23;

$fn=50;

translate([0,0,0]) {servo();}

module servo(){
	union(){
		translate([-length/2-0.2, -width/2, -11.5]){
			//body
			union(){
				cube([length+0.4, width, length]);
				translate([length, 0, 19]){
					union(){
						difference(){
							cube([5, width, 2.5]);
							
							translate([3, 5.75, -1]) cube([4, 1.5, 4]);						
						}
						#translate([0.8, 0, 0]) hull(){
							translate([2.4, width/2, -5]){
								cylinder(h=15, r=1.25);
							}							
							translate([1.4, width/2, -5]){
								cylinder(h=15, r=1.25);
							}
						}						
					}
				}
				translate([-5, 0, 19]){
					union(){
						difference(){
							cube([5, width, 2.5]);

							translate([-2, 6, -1]) cube([4, 1.5, 4]);												
						}
						#hull(){
							translate([2, width/2, -5]){
								cylinder(h=15, r=1.25);
							}								
							translate([3, width/2, -5]){
								cylinder(h=15, r=1.25);
							}
						}
					}
				}					
			}

		}
		translate([length/2-width/2, 0, length/2]){
			union(){
				cylinder(h=gearHeight, r=width/2);
				translate([-length/4-1, 0, 0]){
					cylinder(h=gearHeight, r=3.5);
				}
				translate([0, 0, -40]){
					#cylinder(h=80, r=1.2);
				}
			}
		}
	}
	gearHeight = 5.5;
}