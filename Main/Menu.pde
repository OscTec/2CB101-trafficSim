color yellow = color(255, 204, 0);
color green = color(1, 255, 1);
color blue = color(0, 0, 255);
color red = color(255, 0, 0);
color grey = color(122);
color squareColour = grey;
//Default settings
boolean moveIn = true;
boolean collision = true;
boolean slowDown = true;
boolean endPoint = false;
boolean overtake = true;
boolean twoRoads = false;

int x = 0;
int rectX, rectY, rectY1, rectY2, rectY3, rectY4;    // Position of square button
int rectSize = 90;    // Diameter of rect
color rectColor, baseColor;
color rectHighlight, rectHighlight1, rectHighlight2, rectHighlight3, rectHighlight4, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean rectOver1 = false;
boolean rectOver2 = false;
boolean rectOver3 = false;
boolean rectOver4 = false;


class Menu extends PApplet {
  Menu() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(350, 510);
  }

  void setup() {
    rectColor = color(0);
    rectHighlight = rectHighlight1 = rectHighlight2 = rectHighlight3 = color(51);
    baseColor = color(102);
    currentColor = baseColor;
    rectX = 10;
    rectY = rectSize - 80;
    rectY1 = rectSize + 20;
    rectY2 = rectSize + 120;
    rectY3 = rectSize + 220;
    rectY4 = rectSize + 320;
  }

  void draw() {
    update();
    background(currentColor);
    fill(255); 
    text ("Lane Discipline", 120, 60); 
    text ("Collision", 120, 160); 
    text ("Slow Down", 120, 260); 
    text ("End of Road", 120, 360); 
    text ("Both Roads", 120, 460); 
    //Sets colour of buttons depending on if its active or not
    if (moveIn) {
      fill(green);
    } else {
      fill(red);
    }
    stroke(255);
    rect(rectX, rectY, rectSize, rectSize);
    if (collision) {
      fill(green);
    } else {
      fill(red);
    }
    rect(rectX, rectY1, rectSize, rectSize);
    if (slowDown) {
      fill(green);
    } else {
      fill(red);
    }
    rect(rectX, rectY2, rectSize, rectSize);
    if (endPoint) {
      fill(green);
    } else {
      fill(red);
    }
    rect(rectX, rectY3, rectSize, rectSize);
    if (twoRoads) {
      fill(green);
    } else {
      fill(red);
    }
    rect(rectX, rectY4, rectSize, rectSize);
  }


  void update() {//Uses the pointers location to set over if a button is being hovered over
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
      rectOver1 = false;
      rectOver2 = false;
      rectOver3 = false;
      rectOver4 = false;
    } else if ( overRect(rectX, rectY1, rectSize, rectSize) ) {
      rectOver = false;
      rectOver1 = true;
      rectOver2 = false;
      rectOver3 = false;
      rectOver4 = false;
    } else if ( overRect(rectX, rectY2, rectSize, rectSize) ) {
      rectOver = false;
      rectOver1 = false;
      rectOver2 = true;
      rectOver3 = false;
      rectOver4 = false;
    } else if ( overRect(rectX, rectY3, rectSize, rectSize) ) {
      rectOver = false;
      rectOver1 = false;
      rectOver2 = false;
      rectOver3 = true;
      rectOver4 = false;
    } else if ( overRect(rectX, rectY4, rectSize, rectSize) ) {
      rectOver = false;
      rectOver1 = false;
      rectOver2 = false;
      rectOver3 = false;
      rectOver4 = true;
    } else {
      rectOver = rectOver1 = rectOver2 = rectOver3 = rectOver4 = false;
    }
  }


  void mousePressed() {//If pointer over button and clicks toggles the function
    if (rectOver) {
      if (moveIn) {
        moveIn = false;
      } else {
        moveIn = true;
      }
      squareColour = green;
      System.out.println("Button 1 pressed");
    } else if (rectOver1) {
      if (collision) {
        collision = false;
      } else {
        collision = true;
      }
      squareColour = yellow;
      System.out.println("Button 2 pressed");
    } else if (rectOver2) {
      if (slowDown) {
        slowDown = false;
      } else {
        slowDown = true;
      }
      squareColour = yellow;
      System.out.println("Button 3 pressed");
    } else if (rectOver3) {
      if (endPoint) {
        endPoint = false;
      } else {
        endPoint = true;
      }
      squareColour = grey;
      System.out.println("Button 4 pressed");
    } else if (rectOver4) {
      if (twoRoads) {
        twoRoads = false;
      } else {
        twoRoads = true;
      }
      squareColour = green;
      System.out.println("Button 5 pressed");
    }
  }

  boolean overRect(int x, int y, int width, int height) {//Used to know where the mouse pointer is
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  //Methods for returning values which determine if a setting is on or off
  public color getSquareColour() {
    return squareColour;
  }

  public boolean getMoveIn() {
    return moveIn;
  }

  public boolean getCollision() {
    return collision;
  }

  public boolean getSlowDown() {
    return slowDown;
  }

  public boolean getEndPoint() {
    return endPoint;
  }

  public boolean getOvertake() {
    return overtake;
  }

  public boolean getTwoRoads() {
    return twoRoads;
  }
}