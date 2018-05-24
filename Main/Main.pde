import peasy.*;
import java.util.*;
Menu menu;
PeasyCam cam;
Car car;
Road road;
Display display;
final Environment environment = new Environment();
int roadWidth = 90;//3 lanes 5 pixels either side of car 
int roadHeight = 5;
int roadLength = 2000;
int move = 0;




public void settings() {
  size(800, 800, P3D);//Sets main window to 800 by 800 and uses P3D renderer
}

void setup() { 
  menu = new Menu();//Allows use of Menu class
  road = new Road();//Allows use of Road class
  display = new Display();//Allows use of Display class
  cam = new PeasyCam(this, 100);//Sets up the camera
  cam.setMinimumDistance(500);//Set minimum zoom
  cam.setMaximumDistance(5000);//Sets maximum zoom
  addCars(environment);
  environment.clone();
}

void draw() {
  background(menu.getSquareColour());//Gets background colour from menu class
  road.createRoad();//Creates the front road
  road.createBackRoad();//Creates the back road
  display.car();//Creates the cars
  environment.tick();//Runs the functions in cars tick function
}

private void addCars(Environment e) {//Adds the cars to the environment
  Random ra = new Random();
  for (int i = 0; i < 10; ++i) {
    int lane = (1 + ra.nextInt(3));//Picks random lane from 1 to 3
    float speed = ((0.5 + ra.nextInt(20)) / 20.0);//Picks a random speed for each car
    //    float speed = 0.1;//Speed used for testing
    float maxSpeed = speed * 2;
    float acceleration = (0.1);
    float breakEfficacy = (0.5);
    //double position = e.carLength() * 1.2 * i;
    float position = (e.carLength() * 2.2 * i) - 400;
    int r = 0;
    int g = 128;
    int b = 0;
    boolean front = true;
    boolean crashed = false;
    e.add(new Car(position, speed, lane, maxSpeed, acceleration, breakEfficacy, r, g, b, front, crashed));//Assigns the car the above values
    System.out.println("Car " + i + " has lane " + lane + " and a speed of " + speed + " position " + position);
  }
}