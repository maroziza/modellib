/*

  FLEXBATTER: Flexing battery holder with built-in spring

  This file generates battery holders for arbitrary cylindrical sizes.
  The number of batteries compartments, the number of batteries in each compartment
  and the battery size are fully parametrized.

  The usual metallic spring at the minus pole is replaced by a
  flexible printed spring, which is pressing the contacts firmly to 
  the battery.

  The contacts for the plus and minus pole can easily be made by
  a few windings of the uninsulated ends of the connecting wires.
  Each battery compartment contains are several holes to the outside
  as well ad to the neighboring compartments, through which connecting
  wires can be passed for easy configuring of parallel, serial or
  balanced-serial battery packs.
  
  The preconfigured battery sizes are:
  AA, AAA, C, D, 18650(Li-Ion), 18650P(protected Li-Ion), CR123A(16340)
  
  Given that the printed plastic spring needs to be flexible, ABS is the material
  of choice here.

  When adding new presets, add them to both:
     1. create_this_preset and 
     2. presets
  in the same order they appear in "module flexbatter()"

  2014-09-09 Heinz Spiess, Switzerland
  2015-07-25 multi-cell compartments added
  2023-02-21 Updated to make presets selectable (PPL)

  released under Creative Commons - Attribution - Share Alike licence (CC BY-SA)

*/

/* [Presets] */
// Cells High - Cell Type - Cells wide (If a preset other than "Custom", the parameters below are IGNORED)
create_this_preset="Custom"; //[Custom,AAAx1,1xAAA,AAAx2,1xAAAx2,AAAx3,1xAAAx3,AAAx4,1xAAAx4,2xAAA,2xAAAx2,3xAAA,1xAA,2xAA,AAx1,AAx2,1xAAx2,AAx3,1xAAx3,AAx4,1xAAx4,2xAAx2,3xAA,CR123Ax1,3xC,Cx1,1xC,1xCx2,1xCx3,1xCx4,2xC,2xCx2,Cx2,D,18650Px1,18650Px2,18650Px3,18650Px4,18650x1,1x18650,18650x2,1x18650x2,18650x3,1x18650x3,18650x4,1x18650x4,2x18650,2x18650x2,26650x1,26650x2,26650x3,26650x4,1x13400,2x13400,13400x1,13400x2,13400x3,13400x4]

/* [Custom] */
// number of compartments side by side
n=1;             
// number of cells in one compartment
m=1; 
// length of cell           
l=65;            
// diameter of cell
d=18;            
// relative hight of cell (1=full diameter)
hf=0.75;         
// screw hole diameter
shd=3;           
// extra diameter space
eps=0.28;        
// overhang to avoid lifting of cell 
oh=0;           
// extra spring length (needed for small cells)
el=0;          
// relative position of traversal wire channels
xchan=[1/4,3/4]; 
// relative deepening for side grip of batteries
deepen=0;        
// relative deepening radius
df=1;            
// length correction for multicell compartments
lcorr=0;        
// extrusion width
ew=0.56;   
// extrusion height
eh=0.25;   

$fn=24;
module END_OF_VARS(){};

presets=[
["Custom",[1,1,65,18,0.75,3,0.28,0,0,[1/4,3/4],0,1,0]],
["18650Px1",[1,m,70,18.4,0.75,3,0.28,0,0,[1/4,3/4],0,1,0]],
["18650Px2",[2,m,70,18.4,0.75,3,0.28,0,0,[1/4,3/4],0,1,0]],
["18650Px3",[3,m,70,18.4,0.75,3,0.28,0,0,[1/4,3/4],0,1,0]],
["18650Px4",[4,m,70,18.4,0.75,3,0.28,0,0,[1/4,3/4],0,1,0]],
["18650x1",[1,m,7,18.4,0.75,3,0.28,oh,0,[1/4,3/4],deepen,df,0.3]],
["18650x2",[2,m,7,18.4,0.75,3,0.28,oh,0,[1/4,3/4],deepen,df,0.3]],
["18650x3",[3,m,7,18.4,0.75,3,0.28,oh,0,[1/4,3/4],deepen,df,0.3]],
["18650x4",[4,m,7,18.4,0.75,3,0.28,oh,0,[1/4,3/4],deepen,df,0.3]],
["1x18650",[1,1,7,18.4,0.75,3,0.28,ew,0,[1/4,3/4],0.7,0.3,0.3]],
["1x18650x2",[2,1,7,18.4,0.75,3,0.28,ew,0,[1/4,3/4],0.7,0.3,0.3]],
["1x18650x3",[3,1,7,18.4,0.75,3,0.28,ew,0,[1/4,3/4],0.7,0.3,0.3]],
["1x18650x4",[4,1,7,18.4,0.75,3,0.28,ew,0,[1/4,3/4],0.7,0.3,0.3]],
["1xAA",[1,1,50.0,14.4,0.80,2.5,0.28,ew,0.5,[1/4,3/4],0.7,0.25,1.6]],
["1xAAA",[1,1,44.5,10.5,0.84,2,0.2,0.4,1,[0.5],0.7,0.25,1.6]],
["1xAAAx2",[2,1,44.5,10.5,0.84,2,0.2,0.4,1,[0.5],0.7,0.25,1.6]],
["1xAAAx3",[3,1,44.5,10.5,0.84,2,0.2,0.4,1,[0.5],0.7,0.25,1.6]],
["1xAAAx4",[4,1,44.5,10.5,0.84,2,0.2,0.4,1,[0.5],0.7,0.25,1.6]],
["1xAAx2",[2,1,50.0,14.4,0.80,2.5,0.28,ew,0.5,[0.5],0.7,0.25,1.6]],
["1xAAx3",[3,1,50.0,14.4,0.80,2.5,0.28,ew,0.5,[0.5],0.7,0.25,1.6]],
["1xAAx4",[4,1,50.0,14.4,0.80,2.5,0.28,ew,0.5,[0.5],0.7,0.25,1.6]],
["1xC",[1,1,49.6,26.4,0.75,3,0.28,ew,0.5,[0.5],0.67,0.07,2]],
["1xCx2",[2,1,49.6,26.4,0.75,3,0.28,ew,0.5,[0.5],0.67,0.07,2]],
["1xCx3",[3,1,49.6,26.4,0.75,3,0.28,ew,0.5,[0.5],0.67,0.07,2]],
["1xCx4",[4,1,49.6,26.4,0.75,3,0.28,ew,0.5,[0.5],0.67,0.07,2]],
["26650x1",[1,m,65.7,26.4,0.72,3,0.28,ew,0.5,[0.5],0.67,0.07,0]],
["26650x2",[2,m,65.7,26.4,0.72,3,0.28,ew,0.5,[0.5],0.67,0.07,0]],
["26650x3",[3,m,65.7,26.4,0.72,3,0.28,ew,0.5,[0.5],0.67,0.07,0]],
["26650x4",[4,m,65.7,26.4,0.72,3,0.28,ew,0.5,[0.5],0.67,0.07,0]],
["2x18650",[1,2,70,18.4,0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0]],
["2x18650x2",[2,2,70,18.4,0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0]],
["2xAA",[1,2,50.0,14.4,0.80,2.5,0.28,0.4,0.5,[0.5],0.7,df,1.6]],
["2xAAA",[1,2,44.5,10.5,0.84,2,0.2,0.4,1,[0.5],0.7,df,1.6]],
["2xAAAx2",[2,2,44.5,10.5,0.84,2,0.2,ew,1,[0.5],0.7,df,1.6]],
["2xAAx2",[2,2,44.5,10.5,0.84,2,0.2,ew,1,[0.5],0.7,df,1.6]],
["2xC",[1,2,49.6,26.4,0.75,3,0.28,ew,1,[0.5],0.7,df,2]],
["2xCx2",[2,2,49.6,26.4,0.75,3,0.28,ew,1,[0.5],0.7,df,2]],
["3xAA",[1,3,50.0,14.4,0.80,2.5,0.28,ew,0.5,[0.5],0.7,df,1.6]],
["3xAAA",[1,3,44.5,10.5,0.84,2,0.2,0.4,1,[0.5],0.7,df,1.6]],
["3xC",[1,3,49.6,26.4,0.75,3,0.28,ew,1,[0.5],0.7,df,2]],
["AAAx1",[1,m,44.5,10.5,0.84,2,0.2,oh,1,[0.5],deepen,df,1.6]],
["AAAx2",[2,m,44.5,10.5,0.84,2,0.2,oh,1,[0.5],deepen,df,1.6]],
["AAAx3",[3,m,44.5,10.5,0.84,2,0.2,oh,1,[0.5],deepen,df,1.6]],
["AAAx4",[4,m,44.5,10.5,0.84,2,0.2,oh,1,[0.5],deepen,df,1.6]],
["AAx1",[1,m,50.0,14.4,0.80,2.5,0.28,oh,0.5,[0.5],deepen,df,1.6]],
["AAx2",[2,m,50.0,14.4,0.80,2.5,0.28,oh,0.5,[0.5],deepen,df,1.6]],
["AAx3",[3,m,50.0,14.4,0.80,2.5,0.28,oh,0.5,[0.5],deepen,df,1.6]],
["AAx4",[4,m,50.0,14.4,0.80,2.5,0.28,oh,0.5,[0.5],deepen,df,1.6]],
["CR123Ax1",[1,m,35.1,16.7,0.75,3,0.28,oh,0.5,[0.5],deepen,df,0]],
["Cx1",[1,m,49.6,26.4,0.75,3,0.28,oh,0.5,[0.5],deepen,df,2]],
["Cx2",[2,m,49.6,26.4,0.75,3,0.28,oh,0.5,[0.5],deepen,df,2]],
["D",[n,m,61.5,34.0,0.75,3,0.28,oh,0.5,[0.5],deepen,df,0]],
["1x13400",[1,1,41.5,13.0,0.80,2.5,0.28,ew,0.5,[1/4,3/4],0.7,0.25,1.6]],
["2x13400",[1,2,41.5,13.0,0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0]],
["13400x1",[1,1,41.5,13.0,0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0]],
["13400x2",[2,1,41.5,13.0,0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0]],
["13400x3",[3,1,41.5,13.0,0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0]],
["13400x4",[4,1,41.5,13.0,0.75,3,0.28,ew,0.5,[0.5],0.7,0.07,0]]

];

// build a cube with chamfered edges
module chamfered_cube(size,d=1){
   hull(){
     translate([d,d,0])cube(size-2*[d,d,0]);
     translate([0,d,d])cube(size-2*[0,d,d]);
     translate([d,0,d])cube(size-2*[d,0,d]);
   }
}


// draw an arc width height h between radius r1..r2 and angles a1..a2
module arc(r1,r2,h,a1=0,a2=0){
     if(a2-a1<=180){
        difference(){
           cylinder(r=r2,h=h);
           translate([0,0,-1])cylinder(r=r1,h=h+2);
	   rotate(a2)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
	   rotate(a1+180)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
        }
     } else {
           difference(){
              cylinder(r=r2,h=h);
              translate([0,0,-1])cylinder(r=r1,h=h+2);
              intersection(){
	       rotate(a2)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
	       rotate(a1+180)translate([-r1-r2,0,-1])cube([2*(r1+r2),2*(r1+r2),h+2]);
	      }
           }
     }
}


/* sline - generate a "snake line" of width w and height h 
  with a arbitrary sequence of segments defined by a radius and a turning angle
 
    angle[i] > 0  left turn / counter-clockwise
    angle[i] < 0  left turn / clockwise
    angle[i] = 0  straight segment with length radius[i]
 

  Heinz Spiess, 2014-09-06 (CC BY-SA)

*/
module sline(angle,radius,i,w,h){
   scale([angle[i]>=0?1:-1,1,1])
      let(r=abs(radius[i]))let(a=angle[i])
         translate([a?r:0,0,0]){
	    translate([-w/2,-r-0.01,0])cube([w,0.02,h]); // tiny overlap!
             // arc (r1,   r2,   h,a1=0,a2=0)
            if(a)arc(r1=r-w/2,r2=r+w/2,a2=0,a1=a,h=h);
	    else if(r>0)translate([-w/2,-r,0])cube([w,r,h]);
      if(i+1<len(angle))
           rotate(angle[i])
	      translate([a?-r:0,a?0:-r,0])
	         sline(angle,radius,i+1,w,h);
  }
}

//
//  FLEXBATTER:  Flexing battery holder with integrated plastic spring
//

module flexbatter(
  n=1,m=1,l=65,d=18,hf=0.75,shd=3,eps=0.28,oh=0,el=0,xchan=[1/4,3/4],deepen=0,df=1,lcorr=0
  ){
      
      
 $fn=24;
  w = (m>1?6:4)*ew;  // case wall thickness
  wz = 2;            // bottom wall thickness
  ws = 2*ew; // spring wall thickness
  ch = ws; // edge chamfering

  r = d/5+2*ws; // linear spring length (depends on sline() call!)
  L = m*l+lcorr;// corrected overall lenth
  lc = L/m;     // corrected cell length

   for(i=[0:n-1])translate([0,i*(d+2*w-ws),0]){ // generate n battery cases
      difference(){
         
         union(){
            difference(){
               // main body
               translate([0,-w-d/2,0])
	          chamfered_cube([L+w,d+2*w+(i<n-1?ws:0),hf*d+wz+ch],ch);
	       // main cavity
               let(jmin=deepen>0?0:-1)
	       for(j=[0:m-1])translate([j*lc,0,0])hull(){
                  translate([-0.01,-d/2+(j>jmin?oh:0),wz])cube([lc/4,d-(j>jmin?2*oh:0),d+1]);
                  translate([lc*0.75,-d/2+(j<m-1?oh:0),wz])cube([lc/4+0.01,d-(j<m-1?2*oh:0),d+1]);
               }
	       // cavity for locating plastic spring
               translate([-1,-d/2,-1])cube([2,d,d+wz+2]);
	       // small cylindrical carving of walls and bottom
	       translate([-1,0,d/2+wz])rotate([0,90,0])cylinder(r=d/2+eps,h=L+1);
            }
      
            // plastic spring for minus pole
            for(sy=[-1,1])scale([1,sy,1])let(D=d+2*w-2*ws-0.7){
               translate([ch,d/2+w-ws/2,0])rotate(-90)
		  //sline([90,0,120,90,120,90,0],[d/8+2,d/6,d/8-1,d/8,-d/8,d/8,d/2],0,ws,hf*d+w);
		  sline([0,180,0,180,0,-180,0,90,0],[r+ch+el,D/4,el,D/12,el/2,D/12,1+el/2,D/5,D/3],0,ws,hf*d+wz);

            }
         } 
         // lower and upper holes for contacts
         for(z=[-2*ws,2*ws])
            translate([-2*ws,-w,wz-ws/2+d/2+z])cube([L+2*w+2,2*w,ws]);
      
         // longitudinal bottom wire channel
         translate([-2*ws,0,0])rotate([0,90,0])cylinder(r=wz/2,h=L+w+2+r,$fn=5);
      
         // traversal bottom wire channels
         for(x=L*xchan)translate([x,-d/2-w-1,-eh]) rotate([-90,0,0])cylinder(r=wz/2,h=d+2*w+ws+2,$fn=6);
   
         // grip deepening
	if(deepen!=0)
	    for (j=[(deepen>0?0:m-1):m-1])
	    let(adeepen=deepen>0?deepen:-deepen)
            translate([j*lc+lc/2-0.5,-d/2-w-0.01,wz+d+df*l])
    rotate([-90,0,0]){
	          cylinder(r=df*l+adeepen*d,h=d+2*w+2*ws+2,$fn=72);
	          if(i==0)cylinder(r1=df*l+adeepen*d+ch,r2=df*l+adeepen*d,h=ch+0.02,$fn=72);
	          if(i==n-1)translate([0,0,d+2*w-ch])cylinder(r2=df*l+adeepen*d+ch,r1=df*l+adeepen*d,h=ch+0.02,$fn=72);

               }
         // conical screw holes in corners
         for(x=[7+shd,L-2*shd])for(y=[-d/2+shd,d/2-shd])
             translate([x,y,-1]){
                cylinder(r=shd/2,h=wz+2);
                translate([0,0,wz-shd/2+1])cylinder(r1=shd/2,r2=shd,h=shd/2+0.01);
             }

         // holes for wires passing inside
        for(sy=[-1,1])scale([1,sy,1]){
            translate([L-1,-d/2,wz])cube([w+2,2,2]);
            for(x=[3,L-7])translate([x,-d/2-w-ws-1,wz])cube([3,w+ws+3,2]); 
                translate([3,-d/2+w/2-0.75,-1])cube([3,1.5,wz+2]); 
                translate([-0.5,-d/2+w/2,0])rotate([0,90,0])cylinder(r=w/2,h=6.5,$fn=5);
         }

         // engrave battery symbol
        for(j=[0:m-1])translate([j*lc,0,0]){
            translate([w+l/2,d/4+1,wz])cube([l/5,d/4.5,4*eh],true);
            translate([w+l/2+l/10,d/4+1,wz])cube([d/7,d/10,4*eh],true);
	    // engrave plus symbol
            let(sy=(l>12*shd)?1:-1){ // for short batteries +- on the side
	       translate([w+l/2+l/(sy>0?5:10),sy*(d/4+1),wz]){
	          cube([1,d/4,4*eh],true);
	          cube([d/4,1,4*eh],true);
               }
	    // engrave minus symbol
	       translate([w+l/2-l/(sy>0?5:10),sy*(d/4+1),wz])
	          cube([1,d/4,4*eh],true);
            }
        }
      }
      // horizontal contact bulges (+ and - pole)
      for(x=[-0.3,L])
         hull()for(y=[-3+el,3-el])
            translate([x,y,wz+d/2])sphere(r=ws);
   
      // vertical contact bulge (+ pole only)
      if(0)hull()for(z=[-3+el,3-el])for(x=[0,w-ws])
            translate([L+x,0,wz+d/2+z])sphere(r=ws);
   }
}

// This is the Custom/Preset decision
if(create_this_preset=="Custom"){
    flexbatter(n,m,l,d,hf,shd,eps,oh,el,xchan,deepen,df,lcorr);
}else{
    list = [ for (i = presets) if (i[0]==create_this_preset) i];
    n=list[0][1][0];

    flexbatter(n=list[0][1][0],m=list[0][1][1],l=list[0][1][2],d=list[0][1][3],hf=list[0][1][4],shd=list[0][1][5],eps=list[0][1][6],oh=list[0][1][7],el=list[0][1][8],xchan=list[0][1][9],deepen=list[0][1][10],df=list[0][1][11],lcorr=list[0][1][12]);
}