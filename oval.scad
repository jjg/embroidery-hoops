// common sizes
// 4 inches = 101.6
// 5 inches = 127
// 3x2 = 76.2x50.8
// 4x3.5 = 101

//25.4


LENGTH = 76.2;
DIAMETER = 50.8;
HEIGHT = 10;
WIDTH = 3;
CLAMP_LENGTH = 10;
CLAMP_WIDTH = 18;
CLAMP_GAP = 10;
SCREW_SHAFT_DIAMETER = 3.5;

$fn=100;

// inner hoop
difference(){
    scale([1, (LENGTH - 2)/(DIAMETER - 2), 1]){
        cylinder(r=(DIAMETER/2)-2, h=HEIGHT);
    }
    scale([1,(LENGTH - (WIDTH+2))/(DIAMETER - (WIDTH + 2)),1]){
        cylinder(r=(DIAMETER/2)-(WIDTH+2), h=HEIGHT);
    }
}

// outer hoop
difference(){
    union(){

        // hoop
        scale([1,LENGTH/DIAMETER,1]){
            cylinder(r=DIAMETER/2, h=HEIGHT);
        }

        // clamp block
        // TODO: Figure out why we need that -2 on the Y axis
        translate([-(CLAMP_WIDTH/2),(LENGTH/2)-2.5,0]){
            difference(){
                cube([CLAMP_WIDTH,CLAMP_LENGTH,HEIGHT]);
            }
        }
    }

    union(){

        // hoop hole
        scale([1,(LENGTH - WIDTH)/(DIAMETER - WIDTH),1]){
            cylinder(r=(DIAMETER - WIDTH)/2, h=HEIGHT);
        }
    
        // clamp block holes
        translate([-(CLAMP_LENGTH/2),(LENGTH/2),0]){

            // clamp block gap
            translate([(CLAMP_LENGTH/2)-(CLAMP_GAP/2),-WIDTH,0]){
                cube([CLAMP_GAP,CLAMP_GAP+CLAMP_LENGTH+WIDTH,HEIGHT]);
            }

            // screw holes
            translate([-(CLAMP_WIDTH/2),(CLAMP_LENGTH/2) - (SCREW_SHAFT_DIAMETER/2),HEIGHT/2]){
                rotate([0,90,0]){
                    cylinder(r=SCREW_SHAFT_DIAMETER/2,h=CLAMP_WIDTH*2);
                }
            }
        }
    }
}
