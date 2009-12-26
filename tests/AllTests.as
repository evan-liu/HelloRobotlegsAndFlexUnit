package {
  import org.robotlegs.examples.gettime.view.TimeViewMediatorTest;
  import org.robotlegs.examples.gettime.service.LocalTimeServiceTest;

  [Suite]
  [RunWith("org.flexunit.runners.Suite")]
  public class AllTests {
  	public var localTimeServiceTest:LocalTimeServiceTest;
  	public var timeViewMediatorTest:TimeViewMediatorTest;
  }
}