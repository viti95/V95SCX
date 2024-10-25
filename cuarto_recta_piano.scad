include <BOSL2/std.scad>

con_textura = false; // Textura pista
con_sujeccion = true; // Sujeccion madera

// Pista base
difference() {
    cube([350/4,40,8]);
    if (con_sujeccion) {
        xcopies([350/8, 350/24, 5 * 350 / 24]) back(20) up(8) zflip() union() {
                cylinder(h=4,r=7/2, $fn=256);
                translate([0,0,4]) #cylinder(h=4, r1=7/2, r2=3/2, $fn=256);
            }
    }
}

// Sujecciones pista principal
xcopies([350/8, 350/24, 5 * 350 / 24]) left(6) up(5) xrot(180) union() {
    translate([0, 2.9, 0]) cube([4,2,5]);
    color("orange") translate([0, 0, 4.1]) cube([8,4.9,0.9]);
    color("blue") translate([5, 3.9, 4.1]) yrot(180) prismoid(size1=[6,2], size2=[0,2], shift=[2/2,0], h=4.1);
    color("green") xrot(270) translate([10,-4.55,-0.15]) prismoid(size1=[7.15,0.9], size2=[0,0.9], shift=[-2,0], h=5.05);
}
