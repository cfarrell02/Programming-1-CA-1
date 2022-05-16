let y = 200;
let bounceUp;
let x = 0;
let start;
let score = 0;
let hScore = 0;
let xCloud = 700;
let cloudSpeed = 1;
let img;
let xReset = 0;
function setup(){
    bounceUp = true;
    x = random(700, 2500);
    start = false;
    hScore = score;
    createCanvas(600, 400);
    noStroke();
    img=loadImage("data/cloud.png");
}

function draw(){
    drawSquare();
    drawObstacle();
    drawScore();
    if(score >= hScore) {
        hScore=score;
    }
    if(start == false) {
        textSize(70);
        fill(10);
        text("Press b to start!", 30, 150);
        textSize(20);
        text("Press Spacebar to jump", 10, 20);
    }
    if(((key == 'b') || (mouseIsPressed == true)) && (start == false)) {
        start=true;
        x=random(600, 2000);
        y=200;
        xCloud=700;
        score=0;
    }
    if((key == ' ') && (bounceUp == true) && (start == true)) {
        y-=7;
    }
    else if(((key == ' ') && (bounceUp == false) && (start == true)) || ((y <= 200) && (start == true))) {
        y+=6;
    }
    if(y < 40) {
        bounceUp=false;
    }
    else if(y >= 200) {
        bounceUp=true;
        y=200;
        key='0';
        mouseButton=RIGHT_ARROW;
    }
    if(start) {
        x-=8;
        xCloud-=cloudSpeed;
        xReset-=8;
    }
    if(x <= -50) {
        x=random(700, 2600);
        score+=10;
    }
    if((y >= 100) && ((x >= 80) && (x <= 200))) {
        start=false;
    }
    if(xCloud <= -150) {
        xCloud=700;
        cloudSpeed=random(1, 4);
    }
    drawGrid();
}

function drawGrid(){
    fill(248, 255, 75);
    for(let sandX = xReset;sandX <= 620;sandX+=40) {
        for(let sandY = 300;sandY <= 400;sandY+=40) {
            rect(sandX, sandY, 20, 20);
            rect(sandX + 20, sandY + 20, 20, 20);
        }
    }
}

function drawScore(){
    fill(77, 63, 64);
    textSize(20);
    text("Score:" + score, width - 132, 40);
    text("High Score:" + hScore, width - 165, 20);
}

function drawSquare(){
    fill(224, 180, 2);
    background(108, 200, 255);
    rect(0, 300, width, height);
    image(img, xCloud, 50, width / 4, height / 4);
    fill(77, 63, 64);
    rect(100, y, 100, 100);
}

function drawObstacle(){
    fill(16, 142, 10);
    rect(x, 200, 50, 100);
}

