include <Parameter.scad>


slider();


module slider(){
    color("#555555")
    sliderBase();
    color("#aaaaaa")
    handle();
}

module sliderBase(){
    radius=cornerRadius-wallThickness*2;
    hull()
    {
        translate([-sliderX/2+radius,-sliderY/2+radius,0])
        cylinder(h=sliderZ,r=radius,center=true);
        translate([sliderX/2-radius,-sliderY/2+radius,0])
        cylinder(h=sliderZ,r=radius,center=true);
        translate([-sliderX/2+radius,sliderY/2-radius,0])
        cylinder(h=sliderZ,r=radius,center=true);
        translate([sliderX/2-radius,sliderY/2-radius,0])
        cylinder(h=sliderZ,r=radius,center=true);
    }
}

module handle(){
    for(x=[-3:2:3]){
        translate([x,0,sliderZ])
        cube([1,5,0.36],center=true);
    }
}