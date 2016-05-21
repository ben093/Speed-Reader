Slider s = new Slider();
Boolean frozen = false;
String[] words;
int time, wpm;
int currIndex = 0;
String fname = "college.txt";

void setup() {
  size(800, 400);
  surface.setResizable(true);
  time = minute();

  s = new Slider(width/2, 3*height/4, 400, 50);
  s.setMinSpeed(100);
  s.setMaxSpeed(500);
  s.updateSlider(width/2, 3*height/4);
  
  // Setup text stuff
  // All lines
  String[] stuff = loadStrings(fname);
  String oneSentence = "";
  for(int i = 0; i < stuff.length; i++){
     String[] stuff2 = split(trim(stuff[i]), ' ');
     // Split each line on a space
     for(int j = 0; j < stuff2.length; j++)
     {  // Concatenate
       if(trim(stuff2[j]) != "")
          oneSentence += trim(stuff2[j]) + ' ';
     }
  }
  // Create array of all the words.
  words = split(oneSentence, ' ');
}

void draw() {
  wpm = s.getSpeed();
  
  if(mousePressed){
    if(mouseX > s.getMinX() && mouseX < s.getMaxX())
      s.updateSlider(mouseX, mouseY);
  }
    
  float interval = float(wpm) / float(60);
    
  interval = 1000 / interval;            
    
  if (millis() - time >= interval ) {
    s.drawBackground();
    
    // To loop back around to first word.
    currIndex = (currIndex + 1) % words.length;
    
    fill(0);
    textAlign(CENTER, CENTER);
    text(words[currIndex], width/2, height/4);
    time = millis();
  }
  
}

void keyPressed() 
{
 if(key == ' ')
 {
  if(frozen)
  {
    frozen = false; 
    loop();
  }
  else {
    frozen = true;
    noLoop(); 
  }
 }
}