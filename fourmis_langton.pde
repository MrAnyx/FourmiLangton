int[][] tab;


int xAnt, yAnt;


int AntUp = 0;
int AntRight = 1;
int AntDown = 2;
int AntLeft = 3;

int dir;
int compteur = 0;


void setup() {
  size(1200, 800);
  background(255);
  tab = new int[width][height];

  xAnt = width/2;
  yAnt = height/2;
 

  for (int i = 0; i<width-1; i++) {
    for (int j = 0; j<height-1; j++) {
      tab[i][j] = 0;
      tab[i][j] = 0;
    }
  }

  tab[xAnt][yAnt] = 1;
  dir = AntUp;

}
void turnRight() {
  dir++;
  if (dir > AntLeft)dir = AntUp;
}

void turnLeft() {
  dir--;
  if (dir < AntUp)dir = AntLeft;
}

void avance() {
  if (dir == AntUp)xAnt--;
  else if (dir == AntRight)yAnt++;
  else if (dir == AntDown)xAnt++;
  else if (dir == AntLeft)yAnt--;

  if (xAnt < 0)xAnt = width-1;
  else if (xAnt > width - 1)xAnt = 0;

  if (yAnt < 0)yAnt = height-1;
  else if (yAnt > height - 1)yAnt = 0;
}


void draw() {

  for (int i = 0; i<100; i++) {
    if (tab[xAnt][yAnt] == 0) {
      tab[xAnt][yAnt] = 1;
      turnRight();
      avance();
    } else {
      tab[xAnt][yAnt] = 0;
      turnLeft();
      avance();
    }
    avance();
  }

  loadPixels();
  for (int i = 0; i<width; i++) {
    for (int j = 0; j<height; j++) {
      int location = i+j*width;
      if (tab[i][j] == 0) {
        pixels[location] = color(255);
      } else {
        pixels[location] = color(255,0,0);
      }
    }
  }
  updatePixels();
  fill(0);
  text(compteur, 5,15);
  compteur+=100;
}


void keyPressed(){
  if(key == ' ')noLoop();
}
