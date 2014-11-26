//    This file is part of PMR-Model.
//
//    PMR-Model is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    PMR-Model is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with PMR-Model.  If not, see <http://www.gnu.org/licenses/>.

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