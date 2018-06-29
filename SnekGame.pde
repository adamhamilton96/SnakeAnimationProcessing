int numSeg = 2;
final int maxSeg = 1000;
float len = 2;
ArrayList<Segment> snake = new ArrayList<Segment>();
Apple apple;

// Animation
float targetx;
float targety;
float speed = 4;

// Control
boolean aiMode = true;
boolean paused = false;

void setup() {
  size(800, 800);
  //fullScreen();
  frameRate(44);
 
  // Snake setup
  // Head
  snake.add(new Segment(50, 50, len, 0));
  // Body
  for(int i = 1; i < numSeg; i++) {
    snake.add(new Segment(snake.get(i - 1), len, 0)); 
  }
  // Apple
  apple = new Apple(25, 25, 20);
  targetx = 25;
  targety = 25;
}

void draw() {
  if(!paused) {
    background(51);
    strokeWeight(1);
    stroke(0);
      
    // Apple Drawing
    apple.show();
   
    // Snake Drawing  
    for(int i = 0; i < numSeg; i++) {
      // Draw Snake
      snake.get(i).show();
      
      // Apple Snake Collision
      if(snake.get(i).A.x >= apple.x && snake.get(i).A.y >= apple.y && snake.get(i).A.x <= apple.x + apple.size && snake.get(i).A.y <= apple.y + apple.size) {
        apple.x = random(40, width - 40);
        apple.y = random(40, height - 40);
        if(numSeg < maxSeg){
          snake.add(new Segment(snake.get(numSeg - 1), len, 0));
          numSeg++;
        }
        println(numSeg);
      }
    }  
    
    // Movement
    if(aiMode == true) snake.get(0).follow(targetx, targety);
    else snake.get(0).follow(mouseX, mouseY);
      
    // Body
    for(int i = 1; i < numSeg; i++) {
      snake.get(i).follow(snake.get(i - 1).A.x, snake.get(i - 1).A.y);
      snake.get(i).calculateB();
    }
    
    if (targetx < apple.x + apple.size / 2) targetx += speed;
    else if (targetx > apple.x + apple.size / 2) targetx -= speed;
    if (targety < apple.y + apple.size / 2) targety += speed;
    else if (targety > apple.y + apple.size / 2) targety -= speed;
    snake.get(0).calculateB();
  }
}

void keyPressed() {
  if (key == 'p') {
    if(paused) paused = false;
    else paused = true;
  }
}

void mouseDragged() {
  aiMode = false;
}

void mouseReleased() {
  aiMode = true;
}