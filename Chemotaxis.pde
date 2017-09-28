float sizeB = 10;
Bacteria[] colony;

void setup()
{
  size(400,400);
  colony = new Bacteria [300];
  for (int i=0; i< colony.length; i++)
  {
    colony[i] = new Bacteria();
  }
}

void draw(){
  background (0);
  strokeWeight (4);
  stroke (71,71,71);
  fill (155,155,155);
  ellipse (200,200,520,520);
  for (int i = 0; i < colony.length; i++)
  {
    colony[i].walk();
    colony[i].show();
  }
  
  noStroke();
  fill(255,255,255,200);

  ellipse (mouseX,mouseY-100,40,60);
  rect (mouseX - 15,mouseY-80,30,130);
  triangle (mouseX - 15,mouseY+50,mouseX+15,mouseY+50,mouseX,mouseY +75);
  stroke(255,0,0);
  for (int y = 30; y < 150; y = y+10)
  line (mouseX-15,mouseY-100+y,mouseX,mouseY-100+y);
  //drop
  if (mousePressed == true)
  {
    fill (255,0,0);
    int dropX = mouseX;
    int dropY = mouseY+90;
    ellipse (dropX, dropY,10,10);
    triangle (mouseX-4, mouseY+86, mouseX+4, mouseY+86, mouseX, mouseY+80);
    int colorguessX = dropX - 10;
    int colorguessX2 = dropX +10;
    if ((get(colorguessX,dropY)!= color(155,155,155)) || (get(colorguessX2, dropY) != color(155,155,155)))
        {
        float z = 0.25;
        sizeB = sizeB - z;
        }
    else if ((get(colorguessX,dropY)== color(155,155,155)) || (get(colorguessX2, dropY) == color(155,155,155)))
        {
          float z = 0.25;
          sizeB = sizeB + z;
        }
  }
  if (sizeB >= 20){
    fill (255,0,0);
    textSize(30);
    text ("You Lose", 150,200);
  }
  else if (sizeB <=-5)
  {
     fill (255,0,0);
    textSize(30);
    text ("You Win", 150,200);
  }
}

class Bacteria{
  int bX,bY,bColor;
    Bacteria()
    {
      bX = ((int)(Math.random()*400));
      bY = ((int)(Math.random()*400));
      bColor = 190;
     }
  void walk()
  {
    if (mouseX>bX )
      bX = bX + ((int)(Math.random() *2)-1);
    else
      bX = bX + ((int)(Math.random() *2));
     
    if (mouseY>bY)
      bY = bY +((int)(Math.random() *2)-1);
    else
      bY = bY +((int)(Math.random() *2));
      
     if (bX > 375)
       bX = bX - 15;
     if (bX < 25)
       bX = bX +15;
     if (bY > 375)
       bY = bY - 15;
     if (bY < 25)
       bY = bY+15;
 
  }
  void show()
  {
    strokeWeight(2);
    stroke (193,bColor +24,43);
    fill (236,255,131);
    ellipse (bX,bY,sizeB+20,sizeB+8);
    fill (247,157,127);
    noStroke();
    ellipse (bX,bY,5,5);
  }
  
}    