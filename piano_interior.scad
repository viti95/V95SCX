include <BOSL2/std.scad>

// Pista base
pie_slice(ang=45, l=8, r=118.5/2, $fn=256);

// Sujecciones pista principal
zrot_copies([-45 - 45/4, -45 - (3*45/4)]) translate([-4/2,118.5/2-1, 3]) 
    union() {
        translate([0, 2.75, 0]) cube([4,2,5]);
        color("orange") translate([0, 0, 4.1]) cube([8,4.75,0.9]);
        color("blue") translate([5, 3.75, 4.1]) yrot(180) prismoid(size1=[6,2], size2=[0,2], shift=[2/2,0], h=4.1);
        color("green") xrot(270) translate([10,-4.55,-0.15]) prismoid(size1=[7.15,0.9], size2=[0,0.9], shift=[-2,0], h=4.9);
    }

// Textura pista
tex = texture("rough");
intersection() {
    translate ([-118.5/2,0,1]) yrot(90) linear_sweep(
    square([1,118.5/2]), texture=tex, h=118.5,
    tex_size=[10,10], style="min_edge");
    translate([0,0, -1]) #pie_slice(ang=45, l=4, r=118.5/2, $fn=256);
}