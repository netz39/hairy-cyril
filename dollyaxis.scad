difference() {
	union() {
		cylinder(r=4,h=11);
		cylinder(r=6,h=2);
		translate([-5,-2,9])cube([10,4,2]);
		translate([0,0,-5])cylinder(r=4,h=5);
	}
	translate([-2,-4,5])cube([4,8,6]);
}