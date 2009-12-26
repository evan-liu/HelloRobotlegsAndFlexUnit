package {
  import org.flexunit.runner.IDescription;
  import org.flexunit.runner.Result;
  import org.flexunit.runner.notification.Failure;
  import org.flexunit.runner.notification.IRunListener;

  import flash.display.Sprite;
  import flash.text.TextField;
  import flash.text.TextFormat;
  /**
   * @author eidiot
   */
  public class ETestListener extends Sprite implements IRunListener {
    //==========================================================================
    //  Constructor
    //==========================================================================
    public function ETestListener() {
      super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    protected var barHeight:Number = 20;
    protected var barTotalWidth:Number = 0;
    protected var redColor:uint = 0xFF0000;
    protected var greenColor:uint = 0x00FF00;
    //
    protected var leftMargin:Number = 10;
    protected var rightMargin:Number = 10;
    protected var topMargin:Number = 10;
    protected var bottomMargin:Number = 10;
    //
    protected var totalCount:int = 0;
    protected var testedCount:int = 0;
    //
    protected var bar:Sprite;
    protected var tf:TextField;
    //==========================================================================
    //  Overridden methods
    //==========================================================================
    public function testRunStarted(description:IDescription):void {
      totalCount = description.testCount;
      testedCount = 0;
    }
    public function testRunFinished(result:Result):void {
      if (result.successful) {
        drawBar(greenColor, totalCount);
        printSuccess(result);
      } else {
        drawBar(redColor, totalCount);
        printFail(result);
      }
    }
    public function testStarted(description:IDescription):void {
      updateTf(description.displayName);
    }
    public function testFailure(failure:Failure):void {
      testedCount += failure.description.testCount;
      drawBar(redColor, testedCount);
      updateTf(failure.message);
    }
    public function testIgnored(description:IDescription):void {
      testedCount += description.testCount;
    }
    public function testFinished(description:IDescription):void {
      testedCount += description.testCount;
      drawBar(greenColor, testedCount);
    }
    public function testAssumptionFailure(failure:Failure):void {
    }
    //==========================================================================
    //  Private methods
    //==========================================================================
    private function createBar():void {
      bar = new Sprite();
      addChild(bar);
      bar.x = leftMargin;
      bar.y = topMargin;
      barTotalWidth = stage.stageWidth - leftMargin - rightMargin;
    }
    private function drawBar(color:uint, index:int):void {
      if (!stage) {
        return;
      }
      if (!bar) {
        createBar();
      }
      with (bar.graphics) {
        clear();
        beginFill(color);
        drawRect(0, 0, (index / totalCount) * barTotalWidth, barHeight);
        endFill();
      }
    }
    private function createTf():void {
      tf = new TextField();
      addChild(tf);
      tf.x = leftMargin;
      tf.y = topMargin + barHeight;
      tf.width = stage.stageWidth - leftMargin - rightMargin;
      tf.height = stage.stageHeight - topMargin - bottomMargin - barHeight;
      tf.defaultTextFormat = new TextFormat("Verdana", 12, 0x000000, true);
    }
    private function updateTf(content:String):void {
      if (!stage) {
        return;
      }
      if (!tf) {
        createTf();
      }
      tf.text = content;
    }
    private function printSuccess(result:Result):void {
      var msg:String = "OK";
      msg += "\nRun " + result.runCount + " tests";
      msg += " in " + result.runTime + "ms";
      updateTf(msg);
    }
    private function printFail(result:Result):void {
      var msg:String = "Failed";
      if (result.failures.length == 0) {
        updateTf(msg);
        return;
      }
      for each (var failure:Failure in result.failures) {
        msg += "\n\n" + failure.message;
        msg += "\n[" + failure.testHeader + "()";
        if (failure.stackTrace && failure.stackTrace.indexOf("at") != -1) {
          var find:String = failure.testHeader.split("::")[0];
          var list:Array = failure.stackTrace.split("\n");
          for each (var item:String in list) {
            if (item.indexOf("at") != -1 && item.indexOf(find) != -1) {
              msg += item.slice(item.lastIndexOf(":"), item.length - 1);
              break;
            }
          }
        }
      }
      msg += "]";
      updateTf(msg);
    }
  }
}