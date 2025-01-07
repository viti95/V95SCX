include <BOSL2/std.scad>

con_sujeccion = true; // Sujeccion madera

// Pista base
difference() {
    pie_slice(ang=45, l=8, r=118.5/2, $fn=256);
    zrot(-5) pie_slice(ang=55, l=8, r=(118.5/2)-40, $fn=256);
    move ([40*cos(45/2),40*sin(45/2)])
    if (con_sujeccion) {
        cylinder(h=4,r=7/2, $fn=256);
        translate([0,0,4]) cylinder(h=4, r1=7/2, r2=3/2, $fn=256);
    }
}

// Sujecciones pista principal
zrot_copies([-45 - 45/4, -45 - (3*45/5)]) translate([-4/2,118.5/2-1, 3])
    union() {
        translate([0, 2.9, 0]) cube([4,2,5]);
        color("orange") translate([0, 0, 4]) cube([8,4.9,1]);
        color("blue") translate([5, 3.9, 4]) yrot(180) prismoid(size1=[6,2], size2=[0,2], shift=[2/2,0], h=4);
        color("green") xrot(270) translate([10,-4.5,-0.15]) prismoid(size1=[7.15,1], size2=[0,1], shift=[-2,0], h=5.05);
    }
