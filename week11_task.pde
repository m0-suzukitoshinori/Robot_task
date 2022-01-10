void setup(){ 
  size(240, 240);
  strokeWeight(10);
}

void draw(){
  background(200); 
  fill(255);
  if (keyPressed){
      if(key == 't'){
      fill(255, 255, 0);
    }
  }
  if (mousePressed == false){
    stroke(0);
    rect(80, 80, 80, 80);
  }
  else{
    stroke(0);
    triangle(120, 80, 80, 160, 160, 160);
  }
}
