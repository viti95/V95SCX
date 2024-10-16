include <BOSL2/std.scad>

// Pista base
pie_slice(ang=45*4, l=8, r=118.5/2, $fn=256);

// Sujecciones pista principal
zrot_copies([45/2, 45/2 + 45, -45/2, -45/2 - 45]) translate([-4/2,118.5/2-1, 3]) difference() {
    cube([4,4+1,5]);
    #cube([4,2+1,3]);
}

// Textura pista
tex = texture("rough");
intersection() {
    translate ([-118.5/2,0,1]) yrot(90) linear_sweep(
    square([1,118.5/2]), texture=tex, h=118.5,
    tex_size=[10,10], style="min_edge");
    translate([0,0, -1]) #pie_slice(ang=45*4, l=4, r=118.5/2, $fn=256);
}