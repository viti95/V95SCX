include <BOSL2/std.scad>

con_textura = false; // Textura pista
con_sujeccion = true; // Sujeccion madera

// Pista base
difference() {
    pie_slice(ang=45, l=8, r=(430/2)+40, $fn=256);
    zrot(-5) pie_slice(ang=55, l=8, r=(430/2), $fn=256);
    zrot_copies([45/3, 0, -45/3]) move ([235*cos(45/2),235*sin(45/2),8]) zscale(-1)
    if (con_sujeccion) {
        cylinder(h=4,r=7/2, $fn=256);
        translate([0,0,4]) cylinder(h=4, r1=7/2, r2=3/2, $fn=256);
    }
}

// Sujecciones pista principal
zrot_copies([-45 - 45/6,-45 - 45/2, -45 - (5*45/6)]) translate([-4/2,(430/2)+1, 5])
    xrot(180) union() {
        translate([0, 2.9, 0]) cube([4,2,5]);
        color("orange") translate([0, 0, 4.1]) cube([8,4.9,0.9]);
        color("blue") translate([5, 3.9, 4.1]) yrot(180) prismoid(size1=[6,2], size2=[0,2], shift=[2/2,0], h=4.1);
        color("green") xrot(270) translate([10,-4.55,-0.15]) prismoid(size1=[7.15,0.9], size2=[0,0.9], shift=[-2,0], h=5.05);
    }

// Textura pista
if (con_textura) {
    tex = texture("rough");
    translate([0,0,7]) intersection() {
        translate ([430/4,0,1]) yrot(90) linear_sweep(
        square([1,430/2+40]), texture=tex, h=430/3+40,
        tex_size=[10,10], style="min_edge");
        translate([0,0, -1]) #difference() {
            pie_slice(ang=45, l=8, r=(430/2)+40, $fn=256);
            zrot(-5) pie_slice(ang=55, l=8, r=(430/2), $fn=256);
            zrot_copies([45/3, 0, -45/3]) move ([235*cos(45/2),235*sin(45/2),8]) zscale(-1)
                if (con_sujeccion) {
                    cylinder(h=4,r=7/2, $fn=256);
                    translate([0,0,4]) cylinder(h=4, r1=7/2, r2=3/2, $fn=256);
                }
        }
    }
}

