screwDiam = 8;
dollyHeigth = 100;
dollyWidth = 30;

beltWidth = 4;
beltHeigth = 1;

module mainbody() {
	union(){
		translate([-35, -15,0]) cube([70,30,dollyHeigth]);
		translate([35,0,0]) rotate([0,0,45]) translate([-sqrt(450)/2,-sqrt((dollyWidth*dollyWidth)/2)/2,0]) cube([sqrt((dollyWidth*dollyWidth)/2),sqrt((dollyWidth*dollyWidth)/2),dollyHeigth]);
		translate([-35,0,0]) rotate([0,0,45]) translate([-sqrt(450)/2,-sqrt((dollyWidth*dollyWidth)/2)/2,0]) cube([sqrt((dollyWidth*dollyWidth)/2),sqrt((dollyWidth*dollyWidth)/2),dollyHeigth]);
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
	translate([0,dollyWidth/2-3.5,dollyHeigth/2])ballBearing();
	translate([0,-(dollyWidth/2-3.5),dollyHeigth/2])ballBearing();
	translate([0,15,dollyHeigth/2])rotate([90,0,0])cylinder(r=9,h=30);
}

module beltSlot() {
	translate([12,-5,0])cube([10,10,dollyHeigth]);
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