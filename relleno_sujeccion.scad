include <BOSL2/std.scad>

altura = 4; // Altura tapa (mm)
margen = 0.2; // Margen (mm)
con_textura = false; // Textura pista

cylinder(h=altura,r=(7 - margen)/2, $fn=256);

if (con_textura) {
    tex = texture("rough");
    intersection() {
        translate ([-15/2,-15/2,1]) yrot(90) linear_sweep(
            square([1,15]), texture=tex, h=15,
            tex_size=[10,10], style="min_edge");
        translate([0,0, -1]) #union() {
            cylinder(h=altura,r=(7 - margen)/2, $fn=256);
        }
    }
}
