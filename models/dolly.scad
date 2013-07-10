screwDiam = 8;
dollyX = 70;
dollyY = 30;
dollyZ = 100;


beltWidth = 6;
beltHeigth = 1.5;

module mainbody() {
	union(){
		translate([-dollyX/2, -dollyY/2,0]) cube([dollyX,dollyY,dollyZ]);
		translate([dollyX/2,0,0]) rotate([0,0,45]) translate([-sqrt((dollyY*dollyY)/2)/2,-sqrt((dollyY*dollyY)/2)/2,0]) cube([sqrt((dollyY*dollyY)/2),sqrt((dollyY*dollyY)/2),dollyZ]);
		translate([-35,0,0]) rotate([0,0,45]) translate([-sqrt(450)/2,-sqrt((dollyY*dollyY)/2)/2,0]) cube([sqrt((dollyY*dollyY)/2),sqrt((dollyY*dollyY)/2),dollyZ]);
	}
}

module axesholes() {
	translate([35,0,10])rotate([90,0,45])cylinder(h=30,r=screwDiam/2);
	translate([35,0,dollyZ-10])rotate([90,0,45])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,10])rotate([90,0,-45])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,dollyZ-10])rotate([90,0,-45])cylinder(h=30,r=screwDiam/2);

	translate([35,0,25])rotate([90,0,135])cylinder(h=30,r=screwDiam/2);
	translate([35,0,dollyZ-25])rotate([90,0,135])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,25])rotate([90,0,-135])cylinder(h=30,r=screwDiam/2);
	translate([-35,0,dollyZ-25])rotate([90,0,-135])cylinder(h=30,r=screwDiam/2);
}

module ballBearing() {
	translate([0,3.5,0])rotate([90,0,0])cylinder(r=11,h=7);
}

module centralMount() {
	translate([0,dollyY/2-3.5,dollyZ/2])ballBearing();
	translate([0,-(dollyY/2-3.5),dollyZ/2])ballBearing();
	translate([0,15,dollyZ/2])rotate([90,0,0])cylinder(r=9,h=30);
}

module beltSlot() {
	translate([12,-5,0])cube([10,10,dollyZ]);
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