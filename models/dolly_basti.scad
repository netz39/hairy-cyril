module dolly(width, length, side_width, bearing_outer_diameter, bearing_inner_diameter, bearing_heighti, screwhole_diameter) {
	difference() {
		cube([length, width, 30]);
		#cylinder(10, screwhole_diameter, screwhole_diameter, [-width/2 + 2.4,0 , 0]);
	}
	translate([bearing_outer_diameter + 20, width / 2, 30]) difference() {
		cube([bearing_outer_diameter + 20, width / 2 + side_width, bearing_outer_diameter + 20]);
		translate([0, width/2, 0])rotate([-45, 0, 0]) cube(1000, 1000, 1000);
		translate([bearing_outer_diameter / 2 + 10, -1 , bearing_outer_diameter/2 + 15]) rotate([-90,0,0]) cylinder(bearing_height + 1, bearing_outer_diameter / 2, bearing_outer_diameter / 2, [bearing_outer_diameter / 2 + 10, 25, bearing_outer_diameter/4 + 10]);
		translate([bearing_outer_diameter / 2 + 10, width/2 + side_width - bearing_height , bearing_outer_diameter/2 + 15]) rotate([-90,0,0]) cylinder(bearing_height + 1, bearing_outer_diameter / 2, bearing_outer_diameter / 2, [bearing_outer_diameter / 2 + 10, 25, bearing_outer_diameter/4 + 10]);
		translate([bearing_outer_diameter / 2 + 10, 0 , bearing_outer_diameter/2 + 15]) rotate([-90,0,0]) cylinder(1000 + 1, bearing_inner_diameter / 2, bearing_inner_diameter / 2, [bearing_outer_diameter / 2 + 10, 25, bearing_outer_diameter/4 + 10]);
	}
}

dolly(56, 100, 11.5, 23, 8, 7);
