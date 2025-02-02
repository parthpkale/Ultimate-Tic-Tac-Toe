// Global Variables
PImage fullTable;
PImage x;
PImage o;
PImage selSquareBack;
PImage xWin;
PImage oWin;
PImage htp;
PImage htpHeader;
PImage htpGameInfo;

boolean [] currSquare = {false, false, false, false, true, false, false, false, false};
boolean wantToSee = false;

int squareNum = 4;

// squareInfo = {squareNum, init x, init y, final x, final y, who owns, largeSquareNumber}
int [][] squareInfo =  {{0, 70, 70, 120, 120, -1, 0}, {1, 120, 70, 170, 120, 9, 0}, {2, 170, 70, 235, 120, 2, 0}, 
                        {0, 250, 70, 300, 120, -1, 1}, {1, 300, 70, 350, 120, 9, 1}, {2, 350, 70, 415, 120, 2, 1}, 
                        {0, 430, 70, 480, 120, -1, 2}, {1, 480, 70, 530, 120, 9, 2}, {2, 530, 70, 650, 120, 2, 2}, 
                        {3, 70, 120, 120, 170, 3, 0}, {4, 120, 120, 170, 170, 4, 0}, {5, 170, 120, 235, 170, 5, 0}, 
                        {3, 250, 120, 300, 170, 3, 1}, {4, 300, 120, 350, 170, 4, 1}, {5, 350, 120, 415, 170, 5, 1}, 
                        {3, 430, 120, 480, 170, 3, 2}, {4, 480, 120, 530, 170, 4, 2}, {5, 530, 120, 650, 170, 5, 2},
                        {6, 70, 170, 120, 235, 6, 0}, {7, 120, 170, 170, 235, 7, 0}, {8, 170, 170, 235, 235, 8, 0}, 
                        {6, 250, 170, 300, 235, 6, 1}, {7, 300, 170, 350, 235, 7, 1}, {8, 350, 170, 415, 235, 8, 1}, 
                        {6, 430, 170, 480, 235, 6, 2}, {7, 480, 170, 530, 235, 7, 2}, {8, 530, 170, 650, 235, 8, 2}, 
                        {0, 70, 250, 120, 300, -1, 3}, {1, 120, 250, 170, 300, 9, 3}, {2, 170, 250, 235, 300, 2, 3}, 
                        {0, 250, 250, 300, 300, -1, 4}, {1, 300, 250, 350, 300, 9, 4}, {2, 350, 250, 415, 300, 2, 4}, 
                        {0, 430, 250, 480, 300, -1, 5}, {1, 480, 250, 530, 300, 9, 5}, {2, 530, 250, 650, 300, 2, 5}, 
                        {3, 70, 300, 120, 350, 3, 3}, {4, 120, 300, 170, 350, 4, 3}, {5, 170, 300, 235, 350, 5, 3}, 
                        {3, 250, 300, 300, 350, 3, 4}, {4, 300, 300, 350, 350, 4, 4}, {5, 350, 300, 415, 350, 5, 4}, 
                        {3, 430, 300, 480, 350, 3, 5}, {4, 480, 300, 530, 350, 4, 5}, {5, 530, 300, 650, 350, 5, 5}, 
                        {6, 70, 350, 120, 415, 6, 3}, {7, 120, 350, 170, 415, 7, 3}, {8, 170, 350, 235, 415, 8, 3}, 
                        {6, 250, 350, 300, 415, 6, 4}, {7, 300, 350, 350, 415, 7, 4}, {8, 350, 350, 415, 415, 8, 4}, 
                        {6, 430, 350, 480, 415, 6, 5}, {7, 480, 350, 530, 415, 7, 5}, {8, 530, 350, 650, 415, 8, 5}, 
                        {0, 70, 430, 120, 480, -1, 6}, {1, 120, 430, 170, 480, 9, 6}, {2, 170, 430, 235, 480, 2, 6}, 
                        {0, 250, 430, 300, 480, -1, 7}, {1, 300, 430, 350, 480, 9, 7}, {2, 350, 430, 415, 480, 2, 7}, 
                        {0, 430, 430, 480, 480, -1, 8}, {1, 480, 430, 530, 480, 9, 8}, {2, 530, 430, 650, 480, 2, 8}, 
                        {3, 70, 480, 120, 530, 3, 6}, {4, 120, 480, 170, 530, 4, 6}, {5, 170, 480, 235, 530, 5, 6}, 
                        {3, 250, 480, 300, 530, 3, 7}, {4, 300, 480, 350, 530, 4, 7}, {5, 350, 480, 415, 530, 5, 7}, 
                        {3, 430, 480, 480, 530, 3, 8}, {4, 480, 480, 530, 530, 4, 8}, {5, 530, 480, 650, 530, 5, 8}, 
                        {6, 70, 530, 120, 650, 6, 6}, {7, 120, 530, 170, 650, 7, 6}, {8, 170, 530, 235, 650, 8, 6}, 
                        {6, 250, 530, 300, 650, 6, 7}, {7, 300, 530, 350, 650, 7, 7}, {8, 350, 530, 415, 650, 8, 7}, 
                        {6, 430, 530, 480, 650, 6, 8}, {7, 480, 530, 530, 650, 7, 8}, {8, 530, 530, 650, 650, 8, 8}};
                        
boolean [] squareUsed = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
boolean [] squareWon = {false, false, false, false, false, false, false, false, false};

// largeSquareInfo = {squareNum, init x, init y, final x, final y, who won}
int [][] largeSquareInfo = {{0, 70, 70, 235, 235, -1}, {1, 250, 70, 400, 220, 9}, {2, 430, 70, 635, 220, 2}, {3, 70, 250, 220, 400, 3}, {4, 250, 250, 400, 400, 4}, {5, 430, 250, 635, 400, 5}, {6, 70, 430, 220, 635, 6}, {7, 250, 430, 400, 635, 7}, {8, 430, 430, 635, 635, 8}};

int turnNum = 0;

int sceneNum = 1;

void setup() {
  size(650, 650);
  background(255);
  
  // Import Images
  fullTable = loadImage("Full Table.png");
  x = loadImage("X.png");
  o = loadImage("O.png");
  selSquareBack = loadImage("Select Square Back.png");
  xWin = loadImage("X Win Square.png");
  oWin = loadImage("O Win Square.png");
  htp = loadImage("How to play.png");
  htpHeader = loadImage("How to play header.png");
  htpGameInfo = loadImage("How to play game info.png");
} // end setup

void draw() {
  background(255);
  if (sceneNum == 1) {
    fill(0);
    textSize(55);
    text("ULTIMATE TIC-TAC-TOE", 325, 100);
    image(fullTable, 200, 150, 425, 425);
    
    rect(25, 150, 160, 200, 20);
    rect(25, 375, 160, 200, 20);
    
    fill(255);
    textAlign(CENTER, BOTTOM);
    text("PLAY", 105, 275);
    textSize(40);
    text("HOW TO", 105, 470);
    text("PLAY", 105, 520);
  }
  
  if (sceneNum == 2) {
    image(fullTable, 25, 25, 600, 600);
    fill(0);
    rect(10, 590, 100, 50, 20);
    rect(540, 590, 100, 50, 20);
    fill(255);
    textSize(20);
    text("RESTART", 60, 625);
    textSize(18);
    text("MAIN MENU", 590, 625);
    fill(0);
    if (turnNum%2 == 0) {
      text("X's TURN", 325, 620);
    } else {
      text("O's TURN", 325, 620);
    }
    
    // Showing Yellow Squares
    for(int i = 0; i < 9; ++i) {
      if (currSquare[i] == true) {
        image(selSquareBack, largeSquareInfo[i][1], largeSquareInfo[i][2], 150, 150);
      }
    }
    
    // Placing individual turn images
    for(int i = 0; i < 81; ++i) {
      if (squareUsed[i] == true && squareInfo[i][5] == 0) {
        image(o, squareInfo[i][1], squareInfo[i][2], 50, 50);
      } else if (squareUsed[i] == true && squareInfo[i][5] == 1) {
        image(x, squareInfo[i][1], squareInfo[i][2], 50, 50);
      }
    }
    
    // Placing large square victories
    for(int i = 0; i < 9; ++i) {
      if (squareWon[i] == true && largeSquareInfo[i][5] == 0) {
        image(oWin, largeSquareInfo[i][1], largeSquareInfo[i][2], 150, 150);
      } else if (squareWon[i] == true && largeSquareInfo[i][5] == 1) {
        image(xWin, largeSquareInfo[i][1], largeSquareInfo[i][2], 150, 150);
      }
    }
  }
  
  if (sceneNum == 3) {
    fill(0);
    textSize(35);
    text("ULTIMATE TIC-TAC-TOE", 225, 75);
    image(htpHeader, 50, 100, 400, 45); //1022x115
    image(htp, 50, 150, 550, 377); //1167x800
    image(htpGameInfo, 430, 25, 200, 100); //505x235
    fill(0);
    rect(50, 550, 550, 75, 20);
    fill(255);
    text("BACK TO MAIN MENU", 325, 608);
  }
  
  if (sceneNum == 4) {
    background(255);
    if (whoWon() == 0) {
      image(o, 88, 20, 475, 475);
      fill(0);
      text("O HAS WON AFTER A TOTAL OF " + (turnNum + 1) + " TURNS!", 325, 530);
    } else {
      fill(0);
      text("X HAS WON AFTER A TOTAL OF " + (turnNum + 1) + " TURNS!", 325, 530);
      image(x, 88, 20, 475, 475);
    }
    fill(0);
    rect(50, 550, 250, 75, 20);
    rect(350, 550, 250, 75, 20);
    fill(255);
    text("RESTART", 175, 600);
    text("REVIEW GAME", 475, 600);    
  }
      
  whoWon();
} // end draw

void mousePressed() {
  if (sceneNum == 1 && mouseX > 25 && mouseY > 150 && mouseX < 185 && mouseY < 350) {
    sceneNum = 2;
  } else if (sceneNum == 1 && mouseX > 25 && mouseY > 375 && mouseX < 185 && mouseY < 575) {
    sceneNum = 3;
  }

  if (sceneNum == 2) {
    boolean availableSquareTaken = false;
    int jCopy = updateSquareNum();
    for (int i = 0; i < 9; ++i) {
      if (currSquare[i] == true && mouseX > largeSquareInfo[i][1] && mouseY > largeSquareInfo[i][2] && mouseX < largeSquareInfo[i][3] && mouseY < largeSquareInfo[i][4]) {
        for (int j = 0; j < 81; ++j) {
          if (squareUsed[j] == false && mouseX > squareInfo[j][1] && mouseY > squareInfo[j][2] && mouseX < squareInfo[j][3] && mouseY < squareInfo[j][4]) {
            squareUsed[j] = true;
            turnNum++;
            availableSquareTaken = true;
            whichPlayerPlays(j);
            whoWonLargeSquare();
            jCopy = j;
            currSquare[i] = false;
          }
        }
      }
    }
    if (availableSquareTaken == true) {
      whichLargeSquare(jCopy);
    }
  }
  
  // Restart & Reset
  if (sceneNum == 2 && mouseX > 10 && mouseY > 590 && mouseX < 110 && mouseY < 640) {
    resetAndRestart();
  }
  
  // Game -> Main Menu
  if (sceneNum == 2 && mouseX > 540 && mouseY > 590 && mouseX < 640 && mouseY < 640) {
    sceneNum = 1;
  }
  
  // HTP -> Main Menu
  if (sceneNum == 3 && mouseX > 50 && mouseY > 550 && mouseX < 600 && mouseY < 625) {
    sceneNum = 1;
  }
  
  // End Game -> Play Again
  if (sceneNum == 4 && mouseX > 50 && mouseY > 550 && mouseX < 300 && mouseY < 625) {
    resetAndRestart();
  }
  
  // Analyze Game
  if (sceneNum == 4 && mouseX > 350 && mouseY > 550 && mouseX < 600 && mouseY < 625) {
    wantToSee = true;
    sceneNum = 2;
  }
} // end mousePressed

void whichPlayerPlays(int index) {
  if (turnNum%2 == 0) {
    squareInfo[index][5] = 0;
  } else {
    squareInfo[index][5] = 1;
  }
} // end whichPlayerPlays

int updateSquareNum() {
  for (int i = 0; i < 9; ++i) {
    if (currSquare[i] == true) {
      squareNum = i;
    }
  }
  return squareNum;
} // end updateSquareNum

void whichLargeSquare(int index) {
  for (int i = 0; i < 9; ++i) {
    currSquare[i] = false;
  }
  
  if (squareWon[squareInfo[index][0]] == false) {
    currSquare[squareInfo[index][0]] = true;
  } else {
    for (int i = 0; i < 9; ++i) {
      if (squareWon[i] == false) {
        currSquare[i] = true;
      } else {
        currSquare[i] = false;
      }
    }
    currSquare[squareInfo[index][0]] = false;
  }
} // end whichLargeSquare

void whoWonLargeSquare() {
  // Vertical Victory
  for (int i = 0; i < 61; ++i) {
    for (int j = i; j < i+3; ++j) {
      if (squareWon[squareInfo[i][6]] == false && (squareInfo[j][5] == squareInfo[j+9][5] && squareInfo[j+9][5] == squareInfo[j+18][5]) && (squareInfo[j][6] == squareInfo[j+9][6] && squareInfo[j+9][6] == squareInfo[j+18][6])) {
        largeSquareInfo[squareInfo[j][6]][5] = squareInfo[j][5];
        squareWon[squareInfo[j][6]] = true;
      }
    }
    
  }
  
  // Horizontal Victory
  for (int i = 0; i < 79; ++i) {
    if (squareWon[squareInfo[i][6]] == false && (squareInfo[i][5] == squareInfo[i+1][5] && squareInfo[i+1][5] == squareInfo[i+2][5]) && (squareInfo[i][6] == squareInfo[i+1][6] && squareInfo[i+1][6] == squareInfo[i+2][6])) {
      largeSquareInfo[squareInfo[i][6]][5] = squareInfo[i][5];
      squareWon[squareInfo[i][6]] = true;
    }
  }
  
  // Negative Diagonal Victory
  for (int i = 0; i < 61; ++i) {
    if (squareWon[squareInfo[i][6]] == false && (squareInfo[i][5] == squareInfo[i+10][5] && squareInfo[i+10][5] == squareInfo[i+20][5]) && (squareInfo[i][6] == squareInfo[i+10][6] && squareInfo[i+10][6] == squareInfo[i+20][6])) {
      largeSquareInfo[squareInfo[i][6]][5] = squareInfo[i][5];
      squareWon[squareInfo[i][6]] = true;
    }
  }
  
  // Positive Diagonal Victory
  for (int i = 0; i < 63; ++i) {
    if (squareWon[squareInfo[i][6]] == false && (squareInfo[i][5] == squareInfo[i+8][5] && squareInfo[i+8][5] == squareInfo[i+16][5]) && (squareInfo[i][6] == squareInfo[i+8][6] && squareInfo[i+8][6] == squareInfo[i+16][6])) {
      largeSquareInfo[squareInfo[i][6]][5] = squareInfo[i][5];
      squareWon[squareInfo[i][6]] = true;
    }
  } 
} // whoWonLargeSquare

int whoWon() {
  // Vertical Victory
  for (int i = 0; i < 3; ++i) {
    if (wantToSee == false && largeSquareInfo[i][5] == largeSquareInfo[i+3][5] && largeSquareInfo[i+3][5] == largeSquareInfo[i+6][5]){
      sceneNum = 4;
      if(largeSquareInfo[i][5] == 0) {
        return 0;
      } else {
        return 1;
      }
    }
  }
  
  // Horizontal Victory
  for (int i = 0; i < 7; ++i) {
    if (wantToSee == false && largeSquareInfo[i][5] == largeSquareInfo[i+1][5] && largeSquareInfo[i+1][5] == largeSquareInfo[i+2][5]){
      sceneNum = 4;
      if(largeSquareInfo[i][5] == 0) {
        return 0;
      } else {
        return 1;
      }
    }
  }
  
  // Negative Diagonal Victory
  if (wantToSee == false && largeSquareInfo[0][5] == largeSquareInfo[4][5] && largeSquareInfo[4][5] == largeSquareInfo[8][5]){
    sceneNum = 4;
    if(largeSquareInfo[0][5] == 0) {
      return 0;
    } else {
      return 1;
    }
  }
  
  // Negative Diagonal Victory
  if (wantToSee == false && largeSquareInfo[2][5] == largeSquareInfo[4][5] && largeSquareInfo[4][5] == largeSquareInfo[6][5]){
    sceneNum = 4;
    if(largeSquareInfo[0][5] == 0) {
      return 0;
    } else {
      return 1;
    }
  } else {
    return -1;
  }
} // end whoWon

void resetAndRestart() {
  for(int i = 0; i < 81; ++i) {
    squareUsed[i] = false;
  }
  
  for(int i = 0; i < 9; ++i) {
    squareWon[i] = false;
    currSquare[i] = false;
  }
  
  currSquare[4] = true;
  
  for(int i = 0; i < 81; ++i) {
    if (squareInfo[i][0] == 0) {
      squareInfo[i][5] = -1;
    } else if (squareInfo[i][0] == 1) {
      squareInfo[i][5] = 9;
    } else {
      squareInfo[i][5] = squareInfo[i][0];
    }
  }
    
  for(int i = 0; i < 9; ++i) {
    if (largeSquareInfo[i][0] == 0) {
      largeSquareInfo[i][5] = -1;
    } else if (largeSquareInfo[i][0] == 1) {
      largeSquareInfo[i][5] = 9;
    } else {
      largeSquareInfo[i][5] = largeSquareInfo[i][0];
    }
  }
  
  wantToSee = false;
  squareNum = 4;
  turnNum = 0;
  sceneNum = 2; 
} // end resetAndRestart
