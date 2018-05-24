import java.util.ArrayList;

/** A class which represents the environment that we are working in.  In other words,
 *  this class describes the road and the cars that are on the road.
 */
public class Environment implements Cloneable {

  public ArrayList<Car> cars = new ArrayList<Car>();//Creates a array for storing class called car

  private Display display;
  private int lanes = 3;

  public Environment clone() {
    Environment c = new Environment();
    for (Car i : cars) {
      c.cars.add(i.clone());//Adds cars to the enviroment
    }
    return c;
  }

  private void tick() {
    Environment before = Environment.this.clone();
    for (Car i : cars) {
      i.tick(before);//Uses the method tick in class car
    }
  }

  public void add(Car car) {
    cars.add(car);
  }

  public void clear() {
    cars.clear();
  }

  public float carLength() {
    return 40;
  }

  /** @return Number of lanes */
  public int getLanes() {
    return lanes;
  }
}