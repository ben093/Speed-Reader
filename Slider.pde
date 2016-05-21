class Slider {
  int xpos, ypos;
  int w, h;
  int minX, maxX, minY, maxY;
  int minSpeed, maxSpeed;
  int speed;
  int previousX;
  
  // Constructor
  Slider(){
  }
  
  Slider(int ax, int ay, int aw, int ah){
    xpos = ax;
    ypos = ay;
    w = aw;
    h = ah;
    
    minX = xpos - (w/2);
    maxX = xpos + (w/2);
    
    minY = ypos - (h/2);
    maxY = ypos + (h/2);
    
    // Setup the rectangle for slider
    fill(color(255));
    rectMode(CORNERS);
    rect(xpos - (w/2), ypos - (h/2),xpos + (w/2), ypos + (h/2));  
  }
  
  void setMinSpeed(int min){
    minSpeed = min; 
  }
  
  void setMaxSpeed(int max){
    maxSpeed = max; 
  }
  
  int getMinX(){
    return minX; 
  }
  
  int getMaxX(){
    return maxX; 
  }
  
  int getSpeed(){
    return speed;
  }
  
  void drawBackground(){
    background(255);
    fill(0);
    rect(xpos - (w/2), ypos - (h/2), xpos + (w/2), ypos + (h/2));
    
    fill(255,0,0);
    stroke(255,0,0);
    rect(previousX, minY, previousX+2, maxY);
    
    if(speed > 400){
      fill(255,0,0); 
    }
    else if(speed > 200 && speed <= 399){
      fill(0,255,0); 
    }
    else if(speed < 200){
      fill(0,0,255); 
    }
    
    textSize(32);
    textAlign(CENTER, CENTER);
    text(speed, (maxX+minX)/2, (maxY+minY)/2); 
    
    
    fill(0);
    // Draw Slower on left end
    text("Slower", xpos - (w/2 + textWidth("Slower")/2) - 5, ypos);
    // Draw Faster on right end
    text("Faster", xpos + (w/2 + textWidth("Faster")/2) + 5, ypos);
    
  }
    
  
  void updateSlider(int x, int y){
    //drawBackground();
    if(x > minX && x < maxX && y > minY && y < maxY){      
      previousX = x;      
      speed = int(map(x, minX, maxX, minSpeed, maxSpeed));      
    }
    
    
  }
}