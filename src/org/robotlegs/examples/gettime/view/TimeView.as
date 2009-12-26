package org.robotlegs.examples.gettime.view {
  import flash.display.Sprite;
  import flash.text.TextField;
  /**
   * View of the small get time demo.
   *
   * @author eidiot
   */
  public class TimeView extends Sprite {
    //==========================================================================
    //  Constructor
    //==========================================================================
    public function TimeView() {
      super();
      timeTf = new TextField();
      timeTf.width = 500;
      timeTf.height = 100;
      timeTf.border = true;
      timeTf.x = 20;
      timeTf.y = 20;
      addChild(timeTf);
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    public var timeTf:TextField;
    //==========================================================================
    //  Public methods
    //==========================================================================
    public function update(time:Date):void {
      timeTf.text = time.toString();
    }
  }
}