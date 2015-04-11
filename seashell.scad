seashell($fn=32);
//hulled_cylinders(r=1, h=.001, $fn=32);
//shell(age=32, $fn=32);

//Rotation, translation, and scaling vectors
kr=.5;
vr=kr*[
  12,
  11,
  6
];

kt=.5;
vt=kt*[
  .03,
  0,
  .3
];

ks=1;
vs=ks*[
  1.1,
  1.1,
  1.1
];

//Number of times module will call itself
life=32;

module seashell(age=0) {
  echo(str("age=", age));
  shell(age=age);
  if(age < life) {
   scale(vs)
    translate(vt)
      rotate(vr)
        seashell(age=age+1);
  }
}

module shell(r, h, age) {
  difference() {
    hulled_cylinders(r=1, h=.00001);
    hulled_cylinders(r=.9, h=.0001);
  }
}

module hulled_cylinders(r, h) {
  hull() {
    cylinder(r=r, h=h, center=true);
    scale(vs)
      translate(vt)
        rotate(vr)
          cylinder(r=r, h=h, center=true);
  }
}