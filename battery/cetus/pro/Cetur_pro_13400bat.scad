$fa = 5;
$fs = 0.1;

// Cetus rail
rail_width    = 3.7;
rail_length   = 15.9;
rail_thikness = 0.9;
rail_height   = 7.4 - rail_thikness;
rail_distance = 8.6;
rail_back_distance = 7.3;

// Bat
bat_diameter = 12.7;
bat_height = 36;

// Champher is doubled for the angles right under the copter's belly
clamp_champher = 1;

module bat_cutter(d, h) {
  narrow = 0.95 * d;
  length = h * 1.1;
  // I keep internal of the righ a bit tighter, as batt has variable ø
  // Basically to cut cones, connected with narrower parts
  union() {
    translate([0,0,h - length])
      color("#0000cd") cylinder(h=length, d1=narrow, d2=d);
    translate([0,0, - h])
      color("#7fff00")cylinder(h=length, d2=narrow, d1=d);
  }
}

// Cutter should have an impeller-like shape
module neck_cutter(neck_width, neck_height, slit) {
  diameter = neck_height < neck_width ? neck_height : neck_width;
  difference() {
    translate([0, 0, slit/2])
      cube([neck_height * 1.1, neck_width * 1.1, slit * 0.99], center=true);
    resize([neck_height, neck_width]) {
      // I want to have a cutter form and then stretch it to the
      // real neck
      param = 1;
      union() {
        translate([0, (param - param) / 2])
          color("#Ff6347") cylinder(d=param,h=slit);
        translate([0, - (param - param) / 2])
          color("#Ffebcd") cylinder(d=param,h=slit);
        translate([0, 0, slit / 2])
          cube([param, (param - param), slit], center=true);
        translate([param / 4, param / 4, slit / 2])
          cube([param / 2, param / 2, slit], center=true);
        translate([- param / 4, - param / 4, slit / 2])
          cube([param / 2, param / 2, slit], center=true);
      }
    }
  }
}

module clamp_profile(w, l, keyhole_depth, h, d, champher, b_d, b_h) {
  // The following digits are not supposed to be an external parameters
  // Once you pick the optimal value, it won't be changed
  // -----
  // neck_width - the connector between clips, up from the bat
  // flap_length - the part from the keyhole to the end of the clip
  // length - overall part length
  // slit - the clearense of the clamps
  // t - depth of the keyhole on the jaw (2 * t + slit >> keyhole_depth)
  // -----
  neck_width = d * 0.8;
  flap_length = w / 2;
  length = 2 * w + 2 * flap_length + d;
  slit = keyhole_depth * 0.7;
  t = keyhole_depth / 2;
  echo("Total calculated length: ", length);

  b_t = h * 0.7; // thikness of bat side of the clamp
  bat_outer_diam = b_d * 1.2;
  bat_center_y = (flap_length + w) + d / 2 ;
  bat_center_x = h + slit + bat_outer_diam / 2;

  difference() {
    linear_extrude(l) {
      union() {
      polygon(points=[
                      // (0,0)
                      [0, 3 * champher],
                      [0, length - 3 * champher],

                      [3 * champher , length],
                      [h - champher, length],
                      [h, length - champher],

                      // ----- Jaw (further from 0)
                      // Top jaw
                      [h, length - flap_length],
                      [h - t, length - flap_length],
                      [h - t, length - (flap_length + w)],
                      [h, length - (flap_length + w)],

                      // Neck
                      [h, bat_center_y + neck_width / 2],
                      [h + slit, bat_center_y + neck_width / 2],

                      // Lower jaw
                      [h + slit, length - (flap_length + w)],
                      [h + slit + t, length - (flap_length + w)],
                      [h + slit + t, length - flap_length],
                      [h + slit, length - flap_length],

                      [h + slit, length - champher],
                      [h + slit + champher, length],
                      [h + b_t + slit - champher, length],
                      [h + b_t + slit, length - champher],

                      [h + b_t + slit, champher],
                      // ----- Jaw (closer to 0)
                      [h + b_t + slit - champher, 0],

                      [h + slit + champher, 0],
                      [h + slit, champher],

                      [h + slit , length - (flap_length + 2 * w) - d],
                      [h + slit + t, length - (flap_length + 2 * w) - d],
                      [h + slit + t, length - (flap_length + w) - d],
                      [h + slit , length - (flap_length + w) - d],

                      [h + slit, bat_center_y - neck_width / 2],
                      [h, bat_center_y - neck_width / 2],

                      [h, length - (flap_length + w) - d],
                      [h - t, length - (flap_length + w) - d],
                      [h - t, length - (flap_length + 2 * w) - d],
                      [h, length - (flap_length + 2 * w) - d],

                      [h, champher],
                      [h - champher, 0],

                      [3 * champher, 0]
                      ]);
      translate([bat_center_x, bat_center_y])
        // Bat holding circle with flat stand
        union() {
          color("#F08080") circle(d = bat_outer_diam);
          translate([(bat_outer_diam - slit) / 2, 0])
            minkowski() {
              square([slit * 2 , neck_width * 1.5], center=true);
              circle(d=slit);
            }
        }
      }
    }
    translate([bat_center_x, bat_center_y, l/2])
      bat_cutter(b_d, l);
    translate([h, bat_center_y, l / 2])
      rotate([0, 90, 0])
        neck_cutter(neck_width, l, slit);
  }
}


clamp_profile(rail_width,
              rail_length / 3,
              rail_thikness,
              rail_height,
              rail_distance,
              clamp_champher,
              bat_diameter,
              bat_height);
