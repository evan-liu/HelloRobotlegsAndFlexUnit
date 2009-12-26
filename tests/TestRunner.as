package {
  import org.flexunit.runner.FlexUnitCore;
  public class TestRunner extends ETestListener {
    public function TestRunner() {
      var flexunit:FlexUnitCore = new FlexUnitCore();
      flexunit.addListener(this);
      flexunit.run(AllTests);
    }
  }
}