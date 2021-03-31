// common sizes
// 4 inches = 101.6
// 5 inches = 127
// 6 inches = 
// Convert inches to mm by multiplying by 25.4

DIAMETER = 152.4;
HEIGHT = 10;
WIDTH = 3;
CLAMP = 15;
CLAMP_GAP = 5;
SCREW_SHAFT_DIAMETER = 3.5;

$fn=100;

// inner hoop
difference(){
    cylinder(r=(DIAMETER/2)-2, h=HEIGHT);
    cylinder(r=(DIAMETER/2)-(WIDTH+2), h=HEIGHT);
}

// outer hoop
difference(){
    union(){

        // hoop
        cylinder(r=DIAMETER/2, h=HEIGHT);

        // clamp block
        // TODO: Figure out why we need that -1 on the Y axis
        translate([-(CLAMP/2),(DIAMETER/2)-1,0]){
            difference(){
                cube([CLAMP,CLAMP,HEIGHT]);
            }
        }
    }

    union(){

        // hoop hole
        cylinder(r=(DIAMETER - WIDTH)/2, h=HEIGHT);
        translate([-(CLAMP/2),(DIAMETER/2),0]){

            // clamp block gap
            translate([CLAMP/3,-WIDTH,0]){
                cube([CLAMP_GAP,CLAMP_GAP+CLAMP+WIDTH,HEIGHT]);
            }

            // screw holes
            translate([-(CLAMP/2),CLAMP/2,HEIGHT/2]){
                rotate([0,90,0]){
                    cylinder(r=SCREW_SHAFT_DIAMETER/2,h=CLAMP*2);
                }
            }
        }
    }
}
