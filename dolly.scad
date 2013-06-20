screwDiam = 8;
dollyHeigth = 100;
dollyWidth = 30;

beltWidth = 4;
beltHeigth = 1;

module mainbody() {
	union(){
		translate([-35, -15,0]) cube([70,30,dollyHeigth]);
		translate([35,0,0]) rotate([0,0,45]) translate([-sqrt(450)/2,-sqrt(450)/2,0]) cube([sqrt(450),sqrt(450),dollyHeigth]);
		translate([-35,0,0]) rotate([0,0,45]) translate([-sqrt(450)/2,-sqrt(450)/2,0]) cube([sqrt(450),sqrt(450),dollyHeigth]);
	}
}

module axesholes() {
	translate([35,0,10])rotate([90,0,45])cylinder(h=30,r=screwDiam/2);
	translate([35,0,dollyHeigth-10])rotate([90,0,45])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,10])rotate([90,0,-45])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,dollyHeigth-10])rotate([90,0,-45])cylinder(h=30,r=screwDiam/2);

	translate([35,0,25])rotate([90,0,135])cylinder(h=30,r=screwDiam/2);
	translate([35,0,dollyHeigth-25])rotate([90,0,135])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,25])rotate([90,0,-135])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,dollyHeigth-25])rotate([90,0,-135])cylinder(h=30,r=screwDiam/2);
}

module ballBearing() {
	translate([0,3.5,0])rotate([90,0,0])cylinder(r=11,h=7);
}

module centralMount() {
	translate([0,11.5,dollyHeigth/2])ballBearing();
	translate([0,-11.5,dollyHeigth/2])ballBearing();
	translate([0,15,dollyHeigth/2])rotate([90,0,0])cylinder(r=9,h=30);
}

module beltSlot() {
	translate([beltHeigth-30,dollyWidth/2-beltWidth,0])cube([beltHeigth,beltWidth,dollyHeigth/3]);
	translate([beltHeigth-30, dollyWidth/2-beltWidth,2*dollyHeigth/3])cube([beltHeigth,beltWidth,dollyHeigth/3]);
	translate([-30,dollyWidth/2-beltWidth,0])cube([beltHeigth,beltWidth,dollyHeigth]);
}

module complete() {
	difference() {
		mainbody();
		axesholes();
		centralMount();
		beltSlot();
	}
}

complete();