// model of a bluetooth module with hc05 chip and pinout

boardLength = 40;
boardWidth = 17;
boardHeight = 3;

pins = 8;
pinsTop = 1.5;

hc05();

module hc05(){
	union(){
		cube([boardLength, boardWidth, boardHeight], center=true);
		translate([-boardLength/2+1,0,-1]) cube([2,boardWidth,pins], center=true);
		translate([-boardLength/2-pins/2+2,0,-pins+4]) cube([pins,boardWidth,2], center=true);
	}
}

module hc05_pinless(){	
	cube([boardLength, boardWidth, boardHeight], center=true);
}