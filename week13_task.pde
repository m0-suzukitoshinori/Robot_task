float x = 1000/2;
float y = 1000/2;
float z = 50;
float angleX = 0;
float angleY = 0;
float angleZ = 0;
float locateplusXY = 4;
float locateplusZ = 8;
float angleplus = 0.07;

void setup(){
  size(1000, 1000, P3D);
}

void draw(){
  background(0);
  stroke(0);
  strokeWeight(2);
  fill(255);
  translate(x, y, z);
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);
  box(360);
  if(keyPressed){
    if(key == '1'){
      x = x + locateplusXY;
    }
    if(key == '9'){
      x = x - locateplusXY;
    }
    if(key == '2'){
      y = y - locateplusXY;
    }
    if(key == '8'){
      y = y + locateplusXY;
    }
    if(key == '3'){
      z = z + locateplusZ;
    }
    if(key == '7'){
      z = z - locateplusZ;
    }
    if(key == 'a'){
      angleX = angleX + angleplus;
    }
    if(key == 'A'){
      angleX = angleX - angleplus;
    }
    if(key == 's'){
      angleY = angleY + angleplus;
    }
    if(key == 'S'){
      angleY = angleY - angleplus;
    }
    if(key == 'd'){
      angleZ = angleZ + angleplus;
    }
    if(key == 'D'){
      angleZ = angleZ - angleplus;
    }
    if(key == '0'){
      x = 1000/2;
      y = 1000/2;
      z = 50;
      angleX = 0;
      angleY = 0;
      angleZ = 0;
    }
  }
}
