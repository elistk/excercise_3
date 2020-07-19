import controlP5.*;
import processing.pdf.*;

ControlP5 gui;
DropdownList d1, d2;


int cols, rows;
int scl = 30; //scale; größe der Rechtecke/Kreise
int w = 1000;
int h = 1000;
float rectHeight = 150;
float rot = PI/2;

float flying = 0;

float[][] terrain; //two dimensional array

color bg = color(255,220,80);
color cellCol = color(255,110,80);

String state = "circle"; // to define if rect or circle

Shape s;
Title title;

void setup(){
  size(600,800, P3D);
  cols = w / scl;         //number of columns
  rows = h / scl;         //number of rows
  terrain = new float[cols][rows];
  
  title = new Title();
  
  //UI
  
  gui = new ControlP5(this);

  gui.addSlider("movieLength")
    .setPosition(width/3 - 125, height -100)
    .setSize(250,15)
    .setRange(1,200)
    .setColorActive(color(170))
    .setColorForeground(color(170))
    .setColorBackground(color(90));

  // create a DropdownLists
  
  d1 = gui.addDropdownList("genre")
          .setPosition(width/3 -125, 570)
          .setColorActive(color(170))
          .setColorForeground(color(170))
          .setColorBackground(color(100))
          .setSize(100,200)
          .setBarHeight(15)
          .addItem("Comedy", 0)
          .addItem("Lovestory", 1)
          .addItem("Sci-Fi", 2)
          .addItem("Drama", 3)
          .addItem("Fantasy", 4)
          .setItemHeight(20);

  d2 = gui.addDropdownList("feeling")
          .setPosition(width/3 + 25, 570)
          .setColorActive(color(170))
          .setColorForeground(color(170))
          .setColorBackground(color(100))
          .setSize(100,200)
          .setBarHeight(15)
          .addItem("emotional", 0)
          .addItem("entertaining", 1)
          .addItem("dramatic", 2)
          .addItem("suspenseful", 3)
          .setItemHeight(20);
          
}

void draw(){

  //z-values with perlin noise, stored in two dimensional terrain array
  
  flying -= 0.005;   //speed
  
  float yoff = 0;
  for (int y = 0; y < rows; y++){
    float xoff = flying;
    for (int x = 0; x < cols;  x++){
      terrain [x][y] = map(noise(xoff,yoff), 0, 1, -100, 100);   //z-value for point
      xoff += 0.1;
    }
    yoff += 0.1;
  }
  
  background(bg);
  noStroke();

  pushMatrix();
  translate(width/2, height/2);
  rotateZ(rot);  //rotation als veränderbare Variable 
  
  translate(-w/2,-h/2);
  
  //grid, terrain
  for (int y = 0; y < rows-1; y++){
    //beginShape(LINES);
    for (int x = 0; x < cols; x++){
      //vertex(x*scl, y*scl, terrain [x][y]);               //horizontal lines
      //vertex(x*scl, (y+1)*scl, terrain [x][y+1]);         // diagonal lines
      //circle(x*scl, y*scl,terrain [x][y]);
      s = new Shape(x*scl,y*scl,terrain [x][y], state, cellCol);
      s.update();
      
    }
    //endShape();
    
  }
  popMatrix();
  
  

  //scale-Wert aus Title-Object holen
  scl = title.getScale();    
  
  title.update();
  
  
  rectMode(CENTER);
  rect(width/2,height, width, rectHeight/2);
  
}

void keyPressed(){
 
  title.checkKeyPressed();
 
  if (keyCode == UP ){
    saveFrame("data/line-######.png");
  }
  
}


void mouseReleased(){
    //beginRecord(PDF, "filename.pdf");
    //endRecord();
}

// sets rotation-value
void movieLength(float r){
   rot = PI/(r/100);   //auf Skala anpassen, sodass aus 1-200 Minuten von der Skala 0.1-2 wird damit man es durch PI für die Rotation teilen kann
}


//predefined are the values for "comedy" and "entertaining"

//dropdown Genre
//changes background color
void genre(int g){                
  
  switch(g){
    case 0: bg = color(255,220,80);      //comedy
     break;
    case 1: bg = color(178,48,76);       //lovestory
     break;
    case 2: bg = color(100,100,100);     //sci-Fi
     break;
    case 3: bg = color(9,103,137);       //drama
     break;
    case 4: bg = color(110,68,91);       //fantasy
     break;
  }
  
}

//dropdown feelings
// changes color and shape of moving elements
void feeling (int f){
  
 switch(f){
    case 0: state = "circle";            //emotional
            cellCol = color(182,222,223);
             break;
    case 1: state = "circle";            //entertaining
            cellCol = color(255,110,80);       
            break;
    case 2: state = "rect";              // dramatic
            cellCol = color(255,110,80);
            break;
    case 3: state = "rect";              //suspenseful
            cellCol = color(4,68,79);       
            break;
 }

    
}
