/** Class to display our environment (i.e. the road and the cars) */
public class Display
{//Car dimensions
  public int carWidth = 20;
  public int carHeight = 15;
  public int carLength = 50;
  public int clearance = -28;

  public void setCarHeight(int carHeight) {
    this.carHeight = carHeight;
  }

  public void car() {//Draws the car  
    for (int x = 0; x < environment.cars.size(); x++) {
      int position = (int) environment.cars.get(x).getPosition();
      int lane =  environment.cars.get(x).getLane();
      int blr = 30;
      if (lane == 1) {//Used to move car to right lane
        blr = 30;
      } else if (lane == 2) {
        blr = 0;
      } else if (lane == 3) {
        blr = -30;
      } else if (lane == 4) {
        blr = -170;
      } else if (lane == 5) {
        blr = -200;
      } else if (lane == 6) {
        blr = -230;
      }

      noFill();
      fill(environment.cars.get(x).getR(), environment.cars.get(x).getG(), environment.cars.get(x).getB());//Colours the car
      translate(position, clearance, blr);//box, leftside wheels, rightside wheels
      box(carLength, carHeight, carWidth);//w,h,d
      translate(0, 0, 10);//leftside wheels, rightside wheels
      ellipse(15, 15, 20, 20);
      ellipse(-15, 15, 20, 20);
      translate(0, 0, -20);//leftside wheels
      ellipse(15, 15, 20, 20);
      ellipse(-15, 15, 20, 20);
      translate(0, 0, 10);
      if (lane == 1) {
        translate(-position + 2, 28, -30);    //Used to fix the translate problem (x,y,z)
      } else if (lane == 2) {
        translate(-position + 2, 28, 0);
      } else if (lane == 3) {
        translate(-position + 2, 28, 30);
      } else if (lane == 4) {
        translate(-position + 2, 28, 170);
      } else if (lane == 5) {
        translate(-position + 2, 28, 200);
      } else if (lane == 6) {
        translate(-position + 2, 28, 230);
      }
    }
  }
}