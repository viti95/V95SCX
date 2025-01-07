include <BOSL2/std.scad>

altura = 4; // Altura tapa (mm)
margen = 0.2; // Margen (mm)

cylinder(h=altura,r=(7 - margen)/2, $fn=256);
