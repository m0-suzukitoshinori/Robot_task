float angle = 0;
void setup(){
  size(640, 640);
}
void draw(){ 
  translate(mouseX, mouseY);
  scale((640-mouseX) / 200.0,(640-mouseY) / 200.0);
  rotate(angle);
  rect(20, 20, 20, 40);
   angle += (mouseX+mouseY)/2000.0;
  
}
