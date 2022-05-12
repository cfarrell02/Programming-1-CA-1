void setup(){
  size(600,400); //sets the size
  noStroke(); //removes strokes from shapes
  img = loadImage("cloud.png"); // loads cloud png into variable
}

//All necessary variables are declared here
   int y = 200;
   boolean bounceUp = true;
   float x = random(700,2500);   //uses float as random() requires a float variable
   boolean start = false;
   int score = 0;
   int hScore = score;
   float xCloud = 700;
   float cloudSpeed = 1;
   PImage img;
   int xReset = 0;
   
void draw(){ 

drawSquare(); //draws square and background and landscape

drawObstacle(); //draws the obstacle each time
  
drawScore(); //draws score on screen
  
  if(score >= hScore){ // begins updating the highscore if the score surpasses the current highscore
    hScore = score;
  }
  
  if(start == false){ 
  textSize(70);
  fill(10);
  text("Press b to start!",30,150); //sets a startscreen to display before b is pressed
  textSize(20);
  text("Press Spacebar to jump",10,20);
}
  
  if(((key == 'b') || (mousePressed == true)) && (start == false)){ //begins the game by changing start to true if mouse or b is pressed
    start = true; //start variable to true when b is pressed or mouse
    x = random(600,2000); //brings the obstacle back to a random place off the right side of the screen after an obstacle has been hit
    y = 200; // resets square position
    xCloud = 700;
    score = 0;
}
  
  // if space is pressed and bounceUp are true it will begin moving the square up

 if((key == ' ') && (bounceUp == true) && (start == true)){
  y -= 7;
}
  // if space is true but bounceUp is false it will begin moving the square down or if the square is in the air and start is true 
   else if(((key == ' ') && (bounceUp == false) && (start == true)) || ((y <=200) && (start == true))){  //extra part added here to stop the ball from freezing in mid air if another key is pressed
  y += 6;
}
 
if(y < 40){
  bounceUp = false;  //if y goes below 40 it changes the bounceUp variable to be false
}
else if(y >= 200){
  bounceUp = true;   //if y goes above 200 it changes bounceUp to true for the next jump
  y = 200;    //places square back on the line
  key = '0'; //if y goes above 200 it changes key away from space to 0 as one jump has been completed
  mouseButton = RIGHT; //changes mouseButton away from LEFT
}

if(start){
  x -= 8; //once the start variable becomes true, it begins moving the obstacle towards the ball
  xCloud -= cloudSpeed; //moves the cloud across the screen
  xReset -= 8; //moves the tiled sand across the screen
}

if(x <= -50){
  x = random(700,2600); //brings the obstacle back to a random place off the right side of the screen after it has gone off screen
  score += 10; // adds 10 to the score eveytime an obstacle is reset or 'passed'
}

if((y >= 100) && ((x >= 80) && (x <= 200))){
  start = false; //resets start to false when square touches obstacle
}
if(xCloud<=-150){
  xCloud = 700; // resets cloud
  cloudSpeed = random(1,4); // changes cloud speed
}
drawGrid();
}

void drawGrid(){
fill(248,255,75);
for(int sandX = xReset;sandX <= 620;sandX +=40){  //Draws checkered pattern on the sand and moves sideways
  for(int sandY = 300; sandY <= 400; sandY+=40){
   rect(sandX, sandY, 20, 20); 
   rect(sandX+20, sandY+20,20,20); }
}
}
void drawScore(){
    //draws a score and highscore counter in the top right
  fill(77,63,64);
  textSize(20);
  text("Score:"+score,width-132,40);
  text("High Score:"+hScore,width-165,20); 
}
void drawSquare(){
  //draws the square and background/ground
  fill(224,180,2); 
  background(108,200,255);
  rect(0,300,width,height); 
  image(img,xCloud,50,width/4,height/4);
  fill(77,63,64);
  rect(100,y,100,100); //draws the square each time
}
void drawObstacle(){
  fill(16,142,10); //establishes colour for the obstacles
  rect(x,200,50,100);  //draws the obstacles off screen to the right 
}
