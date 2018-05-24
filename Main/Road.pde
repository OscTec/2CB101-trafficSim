class Road {
  color c1 = color(204, 153, 0);//Road dividers
  color c2 = color(0, 0, 0);//Road, Black
  void createRoad() {//Creates the front road
    fill(c2);//Creating the tarmac
    translate(0, 0, 0);
    box(roadLength, roadHeight, roadWidth);
    fill(c1);//Creating the dividers
    translate(0, 0, 15);
    box(roadLength, roadHeight + 5, 5);
    translate(0, 0, -30);
    box(roadLength, roadHeight + 5, 5);
    translate(0, 0, 15);
  }

  void createBackRoad() {//Creates the further back road
    fill(c2);//Creating the tarmac
    translate(0, 0, 200);
    box(roadLength, roadHeight, roadWidth);
    fill(c1);//Creating the dividers
    translate(0, 0, 15);
    box(roadLength, roadHeight + 5, 5);
    translate(0, 0, -30);
    box(roadLength, roadHeight + 5, 5);
    translate(0, 0, 15);
  }
}