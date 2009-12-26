package org.robotlegs.examples.gettime.service {
  import org.flexunit.async.Async;
  import org.robotlegs.examples.gettime.events.TimeServiceEvent;

  import flash.events.EventDispatcher;
  /**
   * @author eidiot
   */
  public class LocalTimeServiceTest {
    private var instance:LocalTimeService;

    [Before]
    public function setUp():void {
      instance = new LocalTimeService();
      instance.eventDispatcher = new EventDispatcher();
    }

    [Test(async,timeout="500")]
    public function test():void {
      Async.proceedOnEvent(this, instance.eventDispatcher, TimeServiceEvent.TIME_RECEIVED);
      instance.getTime();
    }
  }
}
