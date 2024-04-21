include <Parameter.scad>

baseZtop=baseZ;
baseZdelta=baseZ/2;

wallZtop=baseZtop+wallZ;
wallZdelta=baseZtop+wallZ/2;

coverZtop=wallZtop+coverZ;
coverZdelta=wallZtop+coverZ/2;
coverDelta=1.0;

//use <Switch.scad>

lensCover();

//color("green")
//translate([6,0,1])
//slider();

//color("green")
//translate([-5,2,1])
//slider();


module lensCover(){
    difference()
    {
        color("#339999")
        translate([0,0,baseZdelta])
        base(thickness=baseZ);

        translate([holeDeltaX,0,0])
        cylinder(h=10,d=holeDiameter,center=true);
    }
    color("#66cccc")
    translate([0,0,wallZdelta])
    wall();
    color("#339999")
    translate([0,0,coverZdelta])
    cover();
}

module base(delta=0,thickness){
    radius=cornerRadius-delta;
    hull()
    {
        translate([-(baseX-delta*2)/2+radius,(baseY-delta*2)/2-radius,0])
        cylinder(h=thickness,r=radius,center=true);

        translate([(baseX-delta*2)/2-radius,(baseY-delta*2)/2-radius,0])
        cylinder(h=thickness,r=radius,center=true);

        translate([-(baseX-delta*2)/2+radius,-(baseY-delta*2)/2+radius,0])
        cylinder(h=thickness,r=radius,center=true);

        translate([(baseX-delta*2)/2-radius,-(baseY-delta*2)/2+radius,0])
        cylinder(h=thickness+delta,r=radius,center=true);
    }
}

module wall(){
    difference()
    {
        base(thickness=wallZ);
        base(delta=wallThickness,thickness=wallZ+overlap);
    }
}

module cover(){
    difference()
    {
        base(thickness=coverZ);
        base(delta=coverDelta,thickness=coverZ);
    }
}
