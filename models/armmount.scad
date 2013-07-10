$fn=50;
armX=10;
socketX=armX+4;

module armmount1() {
	difference() {
		translate([-socketX/2,-socketX/2,0])cube([socketX,socketX,3*socketX]);
		translate([-armX/2,-armX/2,0])cube([armX,armX,2*armX]);
	}
	difference() {
		translate([-socketX/2,0,3*socketX])rotate([0,90,0])cylinder(r=socketX/2,h=19);
		translate([-socketX/2,0,3*socketX])rotate([0,90,0])cylinder(r=4,h=19);
	}
}

armmount1();