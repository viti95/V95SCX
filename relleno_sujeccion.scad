include <BOSL2/std.scad>

con_textura = false; // Textura pista

cylinder(h=4,r=7/2, $fn=256);
translate([0,0,4]) cylinder(h=4, r1=7/2, r2=3/2, $fn=256);

if (con_textura) {
    tex = texture("rough");
    intersection() {
        translate ([-15/2,-15/2,1]) yrot(90) linear_sweep(
            square([1,15]), texture=tex, h=15,
            tex_size=[10,10], style="min_edge");
        translate([0,0, -1]) #union() {
            cylinder(h=4,r=7/2, $fn=256);
            translate([0,0,4]) cylinder(h=4, r1=7/2, r2=3/2, $fn=256);
        }
    }
}
