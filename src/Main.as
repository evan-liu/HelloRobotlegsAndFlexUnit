package {
  import org.robotlegs.examples.gettime.GetTimeContext;

  import flash.display.Sprite;
  /**
   * A simple demo of trying TDD on Robotlegs.
   *
   * @author eidiot
   */
  public class Main extends Sprite {
    //==========================================================================
    //  Constructor
    //==========================================================================
    public function Main() {
      context = new GetTimeContext(this);
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var context:GetTimeContext;
  }
}