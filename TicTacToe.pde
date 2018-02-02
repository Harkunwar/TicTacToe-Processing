byte[][] input = new byte[3][3];
boolean zero = true;
boolean win = false;
int[] winLine = new int[4];
boolean zwin = true;

void setup() {
  size(1000,1000);
  strokeWeight(10);
  stroke(255);
  noFill();
}

void draw() {
  background(0);

  // Drawing lines
  line(width/3,3*height/50,width/3,height-30);
  line(2*width/3,3*height/50,2*width/3,height-30);
  line(3*width/50,height/3,width-30,height/3);
  line(3*width/50,2*height/3,width-30,2*height/3);
  
  for(byte i=0;i<3;i++) {
    for(byte j=0;j<3;j++) {
      if(input[i][j] == 1)
        ellipse(9*width/50+(16*width/50*i),9*height/50+(16*height/50*j),width/5,width/5);  
      else if(input[i][j] == 2) {
        line(width/10+(16*width/50*i),height/10+(16*height/50*j),13*height/50+(16*width/50*i),13*height/50+(16*height/50*j));
        line(width/10+(16*width/50*i),13*height/50+(16*height/50*j),13*height/50+(16*width/50*i),height/10+(16*height/50*j));  
      }
    }  
  }  
  
  if(win) line(winLine[0],winLine[1],winLine[2],winLine[3]);
}

void mousePressed() {
  int mx = (int) map(mouseX,0,width,0,3);
  int my = (int) map(mouseY,0,height,0,3);
  if(!win && input[mx][my]==0) {
    input[mx][my] = (byte) (zero?1:2);
    zero = !zero;
    checkWin();
  }
}

void checkWin() {
  //Checking columns
  for(byte i=0;i<3;i++) { 
    if(input[i][0]!=0 && input[i][0] == input[i][1] && input[i][1] == input[i][2]) {
      win=true;
      winLine[0]=24*width/130+(160*width/500*i);;
      winLine[1]=30*height/500;
      winLine[2]=24*width/132+(160*width/500*i);
      winLine[3]=height-30*height/500;
      zwin = input[i][0]==1;
      break;
    }
  }
  
  //Checking rows
  for(int j=0;j<3;j++) { 
    if(input[0][j]!=0 && input[0][j] == input[1][j] && input[1][j] == input[2][j]) {
      win=true;
      winLine[0]=30*width/500;
      winLine[1]=24*height/130+(160*height/500*j);
      winLine[2]=width-30*width/500;
      winLine[3]=24*height/130+(160*height/500*j);
      zwin = input[0][j]==1;
      break;
    }
  }
  
  //Checking diagonals
  if(input[0][0]!=0 && input[0][0] == input[1][1] && input[1][1] == input[2][2]) {
    win=true;
    winLine[0]=30*width/500;
    winLine[1]=30*height/500;
    winLine[2]=width-30*width/500;
    winLine[3]=height-30*height/500;
  }
  if(input[0][2]!=0 && input[0][2] == input[1][1] && input[1][1] == input[2][0]) {
    win=true;
    winLine[0]=width-30*width/500;
    winLine[1]=30*height/500;
    winLine[2]=30*width/500;
    winLine[3]=height-30*height/500;
  } 
}

void keyPressed() {
  input = new byte[3][3];
  zero = true;
  win = false;
  winLine = new int[4];
  background(0);
}
