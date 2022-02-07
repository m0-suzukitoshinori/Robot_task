float x = 30;
float y = -30;
float z = 10;
float L0 = 70;
float L1 = 50;
float L2 = 50;
float L3 = 40;
float L4 = 40;
float T0 = 10;
float T1 = 5;
float T2 = 5;
float T3 = 5;
float T4 = 3;
float L0t = L0 - T1/2;
float L1t = L1 - (T1 + T2)/2;
float L2t = L2 - (T1 + T3)/2;
float L3t = L3 + (T4 - T2)/2;
float L4t = L4/2;
float angle0 = 0;
float angle1 = -45;
float angle2 = 90;
float angle3 = -45;
float m = -5;
float delta = 1.0;
float r = 0;
float xt = 0;
float yt = 0;
float zt = 0;
float N = 0;

void setup(){
  size(1200, 1200, P3D);
  //background(255);
  
  camera(200, -200, 200, 0, 0, 0, 0, 0, -1);
  
  noStroke();  
}

void draw(){
  
  background(255);
   
  //sphere
  pushMatrix();
  
  if(N == 1){
  rotateZ(radians(angle0));
  translate(0, 0, L0/2);
  translate(-(T0+T1)/2, 0, (L0-T1)/2);
  rotateX(radians(angle1));
  translate(0, -(L1-T1)/2, 0);
  translate((T1+T2)/2, -(L1-T2)/2, 0);
  rotateX(radians(angle2));
  translate(0, -(L2-T2)/2, 0);
  translate(-(T2+T3)/2, -(L2-T3)/2, 0);
  rotateX(radians(angle3));
  translate(0, -(L3-T3)/2, 0);
  translate(0, -(L3+T4)/2 , m - L4/2);
  }
  
  else {
  translate(x, y, z);
  }
  
  fill(1);
  sphere(10);
  popMatrix();
  
  //base
  rotateZ(radians(angle0));
  translate(0, 0, L0/2);
  fill(40);
  box(T0, T0, L0);
  
  //1st link
  translate(-(T0+T1)/2, 0, (L0-T1)/2);
  rotateX(radians(angle1));
  translate(0, -(L1-T1)/2, 0);
  fill(150);
  box(T1, L1, T1);
  
  //2nd link
  //go to 2nd joint
  translate((T1+T2)/2, -(L1-T2)/2, 0);
  rotateX(radians(angle2));
  //go to center of 2nd joint
  translate(0, -(L2-T2)/2, 0);
  fill(40);
  box(T2, L2, T2);
  
  //3nd link
  translate(-(T2+T3)/2, -(L2-T3)/2, 0);
  rotateX(radians(angle3));
  translate(0, -(L3-T3)/2, 0);
  fill(150);
  box(T3, L3, T3);
  
  //4nd link
  translate(0, -(L3+T4)/2, m);
  fill(100);
  box(T4, T4, L4);
  
  r = L1t * cos(radians(angle1)) + L2t * cos(radians(angle1 + angle2)) + L3t * cos(radians(angle1 + angle2 + angle3)) - (L4t - m) * sin(radians(angle1 +angle2 + angle3));
  xt = -(T3 + T0)/2 * cos(radians(angle0)) + r * sin(radians(angle0));
  yt = -(T3 + T0)/2 * sin(radians(angle0)) - r * cos(radians(angle0));
  zt = L0t - (L1t * sin(radians(angle1)) + L2t * sin(radians(angle1 + angle2)) + L3t * sin(radians(angle1 + angle2 + angle3)) + (L4t - m) * cos(radians(angle1 + angle2 + angle3)));
  
  if(keyPressed){
    if(key == 'q'){
      angle0 = angle0 + delta;
    }
    if(key == 'Q'){
      angle0 = angle0 - delta;
    }
    if(key == 'w'){
      angle1 = angle1 + delta;
      angle3 = angle3 - delta;
    }
    if(key == 'W'){
      angle1 = angle1 - delta;
      angle3 = angle3 + delta;
    }
    if(key == 'e'){
      angle2 = angle2 + delta;
      angle3 = angle3 - delta;
    }
    if(key == 'E'){
      angle2 = angle2 - delta;
      angle3 = angle3 + delta;
    }
    if(key == 'a'){
      angle1 = angle1 + delta;
      angle2 = angle2 - delta*2;
      angle3 = angle3 + delta;
    }
    if(key == 'A'){
      angle1 = angle1 - delta;
      angle2 = angle2 + delta*2;
      angle3 = angle3 - delta;
    }
    if(key == 's'){
      angle3 = angle3 + delta;
    }
    if(key == 'S'){
      angle3 = angle3 - delta;  
    }
    if(key == 'd' && m >= -(L4 - T3)/2 + 1){
      m = m - delta;  
    }
    if(key == 'D' && m <= (L4 - T3)/2 - 1){
      m = m + delta;  
    }
    if(key == '1'){
      angle1 = 0;
      angle2 = 0;
      angle3 = 0;
    }
    if(key == '2'){
      angle3 = - angle2 - angle1;
    }
    if(key == '0'){
      angle1 = -45;
      angle2 = 90;
      angle3 = -45;
      m = -5;
    }
    if(key == 'o'){
      x = x + delta;
    }
    if(key == 'O'){
      x = x - delta;
    }
    if(key == 'p'){
      y = y - delta;
    }
    if(key == 'P'){
      y = y + delta;
    }
    if(key == 'n' && sqrt((x - xt) * (x - xt) + (y - yt) * (y - yt) + (z - zt) * (z - zt)) <= 5){
      N = 1;
    }
    if(key == 'N'){
      N = 0;
      x = 30;
      y = -30;
      z = 10;
    }
  }
}
