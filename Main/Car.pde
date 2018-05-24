public class Car {
  //Each cars values
  public int count = 0;
  private float position;
  private float speed;
  private int lane;
  private float maxSpeed;
  private float acceleration;
  private float breakEfficacy;
  private int r;
  private int g;
  private int b;
  private boolean front;
  private boolean crashed;
  //Setting each car its values
  public Car(float position, float speed, int lane, float maxSpeed, float acceleration, float breakEfficacy, int r, int g, int b, boolean front, boolean crashed) {
    this.position = position;
    this.speed = speed;
    this.lane = lane;
    this.maxSpeed = maxSpeed;
    this.acceleration = acceleration;
    this.breakEfficacy = breakEfficacy;
    this.r = r;
    this.b = b;
    this.g = g;
    this.front = front;
    this.crashed = crashed;
  }
  //Clones the car with exact same values
  public Car clone() {
    return new Car(position, speed, lane, maxSpeed, acceleration, breakEfficacy, r, g, b, front, crashed);
  }
  //Fucntions that are called every tick for each car
  public void tick(Environment environment) {
    crashed(environment);//Constantly checks if a car has crashed in order to disable it
    //Allows the cars to loop round
    if (menu.getTwoRoads()) {//Checks the menu to see if two roads is active
      comeBack(environment);//Uses both roads
    } else {
      comeBackV2(environment);//Only uses front road
    }
    if (menu.getMoveIn()) {//Checks the menu to see if move in is active
      moveInV4(environment);
    }
    if (menu.getCollision()) {//Checks the menu to see if collision is active
      collisionCheck(environment);
    }
    if (menu.getSlowDown()) {//Checks the menu to see if slow down is active
      slowDown(environment);
    }
    if (menu.getEndPoint()) {//Checks the menu to see if endpoint is active
      endPoint(environment);//Method to stop cars at the end of the road
    }
    if (menu.getOvertake()) {//Checks the menu to see if overtake is active
      overtakeV2();
    }
    position += speed;// Moves cars forward usng the value of their speed
  }

  public void moveInV4(Environment environment) {//Moves cars to inner lane when possible
    int carCount = 0;
    int matchCount = 0;
    if (this.front == true) {//Checks if car is in front road
      if (this.lane == 3) {
      } else if (this.lane == 2) {
        for (Car i : environment.cars) {//Counts how many cars in lane that car wants to move into
          if (i.getLane() == 3) {
            carCount++;
          }
        }
        for (Car i : environment.cars) {
          if (i.getLane() == 3 && this.getPosition() + 72 < i.getPosition()) {//Counts how many cars are in front of car
            matchCount++;
          }
          if (i.getLane() == 3 && i.getPosition() + 72 < this.getPosition()) {//Counts how many cars are behind car
            matchCount++;
          }
        }   
        if (carCount == matchCount) {//If cars are in front and behind but not next to car will change lanes
          this.lane = 3;
        }
      } else if (this.lane == 1) {
        for (Car i : environment.cars) {
          if (i.getLane() == 2) {
            carCount++;
          }
        }
        for (Car i : environment.cars) {
          if (i.getLane() == 2 && this.getPosition() + 72 < i.getPosition()) {
            matchCount++;
          }
          if (i.getLane() == 2 && i.getPosition() + 72 < this.getPosition()) {
            matchCount++;
          }
        }   
        if (carCount == matchCount) {
          this.lane = 2;
        }
      }
    }
    if (this.front == false) {
      if (this.lane == 4) {
      } else if (this.lane == 5) {
        for (Car i : environment.cars) {
          if (i.getLane() == 4) {
            carCount++;
          }
        }
        for (Car i : environment.cars) {
          if (i.getLane() == 4 && this.getPosition() + 72 < i.getPosition()) {
            matchCount++;
          }
          if (i.getLane() == 4 && i.getPosition() + 72 < this.getPosition()) {
            matchCount++;
          }
        }   
        if (carCount == matchCount) {
          this.lane = 4;
        }
      } else if (this.lane == 6) {
        for (Car i : environment.cars) {
          if (i.getLane() == 5) {
            carCount++;
          }
        }
        for (Car i : environment.cars) {
          if (i.getLane() == 5 && this.getPosition() + 72 < i.getPosition()) {
            matchCount++;
          }
          if (i.getLane() == 5 && i.getPosition() + 72 < this.getPosition()) {
            matchCount++;
          }
        }   
        if (carCount == matchCount) {
          this.lane = 5;
        }
      }
    }
  }

  public void overtakeV2() {
    int matchCount = 0;
    int carCount = 0;
    for (Car i : environment.cars) {
      //One car length between current car and next and next car is slower than current
      if (this.front == true && this.lane > 1) {
        if (((this.position) < i.getPosition()) && ((this.position + 72) > i.getPosition()) && (this.lane == i.getLane())) {//If current car is in front road and not in outside lane
          for (Car x : environment.cars) {
            if (x.getLane() == this.lane - 1) {
              carCount++;
            }
          }
          for (Car x : environment.cars) {
            if (x.getLane() == this.lane - 1 && this.getPosition() + 48 < i.getPosition()) {//Checks if car infront
              matchCount++;
            }
            if (x.getLane() == this.lane - 1 && i.getPosition() + 48 < this.getPosition()) {//Checks if car behind
              matchCount++;
            }
            //if (x.getLane() == this.lane - 1 && (this.position > 
          }   
          if (carCount == matchCount) {
            this.lane = this.lane -1;
          } else {
            this.speed = i.getSpeed();
          }
        }
      }
      if (this.front == false && this.lane > 4) {
        if (((this.position) > i.getPosition()) && ((this.position - 96) < i.getPosition()) && (this.lane == i.getLane())) {//If current car is in front road and not in outside lane
          for (Car x : environment.cars) {
            if (x.getLane() == this.lane - 1) {
              carCount++;
            }
          }
          for (Car x : environment.cars) {
            if (x.getLane() == this.lane - 1 && this.getPosition() + 48 < i.getPosition()) {
              matchCount++;
            }
            if (x.getLane() == this.lane - 1 && i.getPosition() + 48 < this.getPosition()) {
              matchCount++;
            }
          }   
          if (carCount == matchCount) {
            this.lane = this.lane -1;
          } else {
            this.speed = i.getSpeed();
          }
        }
      }
    }
  }

  public void endPoint(Environment environment) {//Was used when there was only one road. Left in for testing purposes 
    for (Car i : environment.cars) {
      if (this.getPosition() > 1000) {
        this.speed = 0;
      }
    }
  }

  public void comeBack(Environment environment) {//Method for cars to uses both roads
    int carsLane1 = 0;
    int carsLane2 = 0;
    int carsLane3 = 0;
    int carsLane4 = 0;
    int carsLane5 = 0;
    int carsLane6 = 0;
    for (Car x : environment.cars) {
      if (x.getLane() == 1) {
        carsLane1++;
      }
      if (x.getLane() == 2) {
        carsLane2++;
      }
      if (x.getLane() == 3) {
        carsLane3++;
      }
      if (x.getLane() == 4) {
        carsLane4++;
      }
      if (x.getLane() == 5) {
        carsLane5++;
      }
      if (x.getLane() == 6) {
        carsLane6++;
      }
    }
    for (Car i : environment.cars) {
      if (this.getPosition() > 1000) {
        front = false;    
        if (this.lane == 1) {
          this.position = this.position + (55 * carsLane6);
          this.lane = this.lane + 5;
          this.speed = (this.speed * -1);
          System.out.println("Car " + i + "has speed " + this.speed);
        } else if (this.lane == 2) {
          this.position = this.position + (55 * carsLane5);
          this.lane = this.lane + 3;
          this.speed = (this.speed * -1);
          System.out.println("Car " + i + "has speed " + this.speed);
        } else if (this.lane == 3) {
          this.position = this.position + (55 * carsLane4);
          this.lane = this.lane + 1;
          this.speed = (this.speed * -1);
          System.out.println("Car " + i + "has speed " + this.speed);
        }
      }
      if (this.getPosition() < -1000) {
        front = true;
        if (this.lane == 6) {
          this.position = this.position + (55 * carsLane1);
          this.lane = this.lane - 5;
          this.speed = (this.speed * -1);
          System.out.println("Car " + i + "has speed " + this.speed);
        } else if (this.lane == 5) {
          this.position = this.position + (55 * carsLane2);
          this.lane = this.lane - 3;
          this.speed = (this.speed * -1);
          System.out.println("Car " + i + "has speed " + this.speed);
        } else if (this.lane == 4) {
          this.position = this.position + (55 * carsLane3);
          this.lane = this.lane - 1;
          this.speed = (this.speed * -1);
          System.out.println("Car " + i + "has speed " + this.speed);
        }
      }
    }
  }


  public void comeBackV2(Environment environment) {//Method for cars to loop on front road
    for (Car i : environment.cars) {
      if (this.getPosition() > 1000) {
        front = true;    
        if (this.lane == 1) {
          this.position = this.position - 2000;
        } else if (this.lane == 2) {
          this.position = this.position - 2000;
          System.out.println("Car " + i + "has speed " + this.speed);
        } else if (this.lane == 3) {
          this.position = this.position - 2000;
        }
      }
    }
  }




  public void collisionCheck(Environment environment) {
    for (Car i : environment.cars) {
      if (front) {
        if ((this.position < i.getPosition()) && ((this.position + 48) > i.getPosition()) && (this.lane == i.getLane())) {//Checks if front of car hits another car in same lane
          this.crashed = true;//Sets the car to crashed
          this.acceleration = 0;//Sets acceleration to 0
          this.speed = 0;//Sets speed to 0
          this.r = 255;//Sets color to red
          this.g = 0;
          this.b = 0;
          i.setCrashed(true);
          System.out.println(i.crashed);
          i.acceleration = 0;
          i.setSpeed(0);
          i.r = 255;
          i.g = 0;
          i.b = 0;
        }
      } else {
        if (((this.position) > i.getPosition()) && ((this.position - 48) < i.getPosition()) && (this.lane == i.getLane())) {//This is the opposite as the cars front and back effectively swap
          this.crashed = true;
          this.acceleration = 0;
          this.speed = 0;
          this.r = 255;
          this.g = 0;
          this.b = 0;
          i.setCrashed(true);
          System.out.println(i.crashed);
          i.acceleration = 0;
          i.setSpeed(0);
          i.r = 255;
          i.g = 0;
          i.b = 0;
        }
      }
    }
  }

  public void crashed(Environment environment) {//Disables crashed cars. Needed as the acceleration method I tested accelerate crashed cars
    for (Car i : environment.cars) {
      if (i.crashed) {
        i.speed = 0;
        i.acceleration = 0;
        i.r = 255;
        i.g = 0;
        i.b = 0;
      }
    }
  }


  public void slowDown(Environment environment) {//Method for stopping cars crashing into the back of each other
    //if the car behinds speed is too fast
    for (Car i : environment.cars) {
      if (front) {
        if ((this.position < i.getPosition()) && ((this.position + 52) > i.getPosition()) && (this.lane == i.getLane())) {//Slows them down just before the collision checker 
          //kicks in
          if (this.crashed == true) {
            this.speed = 0;
          } else {
            this.speed = i.getSpeed();
          }
        }
      } else {
        if ((this.position > i.getPosition()) && ((this.position - 52) < i.getPosition()) && (this.lane == i.getLane())) {//Slows them down just before the collision checker 
          //kicks in
          if (this.crashed == true) {
            this.speed = 0;
          } else {
            this.speed = i.getSpeed();
          }
        }
      }
    }
  }

  public void counter() {//Currently not in use but used to allow cars to accelerate 
    //needed other as a tick is to short a time
    if (count < 100) {//This controls how often it accelerates 
      count++;
    } else {
      count = 0;
    }
  }

  public float getPosition() {// Used to get car's position
    return position;
  }

  public float getSpeed() {// Used to get car's speed
    return speed;
  }

  public int getR() {// Used to get car's r value
    return r;
  }

  public int getG() {// Used to get car's g value
    return g;
  }

  public int getB() {// Used to get car's b value
    return b;
  }

  public int getLane() {// Used to get car's lane
    return lane;
  }

  public float getMaxSpeed() {//USed to get car's max speed
    return maxSpeed;
  }

  public void setCrashed(boolean value) {// Used to find out if car has crashed
    this.crashed = value;
  }

  public void setSpeed(float speed) {// Used to set car's speed
    this.speed = speed;
  }
}