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

// Model of standard arduino nano v3 boards

boardLength = 45;
boardWidth = 19;
boardHeight = 2.75;

pins = 8.5;

arduinoNano();
//arduinoNano_withoutPins();


module arduinoNano_withoutPins(){
	translate([-boardLength/2,-boardWidth/2,0]){
		union(){
			cube([boardLength, boardWidth, boardHeight]);				
			translate([-1.5,boardWidth/2-3.75,boardHeight-0.1-0.6]){
				cube([9, 8, 5.2]);
			}
			translate([2-0.1,boardWidth/2,-boardHeight/2+0.1+0.25]){
				cube([4, boardWidth, 3-0.5], center=true);
			}
		}
	}
}

module arduinoNano(){
	union(){
		arduinoNano_withoutPins();
		translate([-boardLength/2,-boardWidth/2,0]){
			union(){
				cube([boardLength, boardWidth, boardHeight]);
				translate([2+2,0,-pins]){
					cube([boardLength-8, 2, pins]);
				}
				translate([2+2,boardWidth-2,-pins]){
					cube([boardLength-8, 2, pins]);
				}			
			}
		}
	}
}