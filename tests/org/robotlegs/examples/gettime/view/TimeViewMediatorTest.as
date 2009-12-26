package org.robotlegs.examples.gettime.view {
  import flexunit.framework.Assert;

  import org.robotlegs.examples.gettime.events.TimeServiceEvent;

  import flash.events.EventDispatcher;
  /**
   * @author eidiot
   */
  public class TimeViewMediatorTest {
    private var instance:TimeViewMediator;
    private var timeService:TimeServiceMock = new TimeServiceMock();

    [Before]
    public function setUp():void {
      instance = new TimeViewMediator();
      instance.eventDispatcher = new EventDispatcher();
      instance.timeView = new TimeView();
      instance.timeService = timeService;
      instance.onRegister();
    }

    [Test]
    public function testCallTimeServiceOnRegister():void {
      Assert.assertTrue(timeService.isCalled);
    }

    [Test]
    public function testUpdateViewWhenTimeServiceComplete():void {
      var time:Date = new Date();
      var event:TimeServiceEvent = new TimeServiceEvent(TimeServiceEvent.TIME_RECEIVED, time);
      instance.eventDispatcher.dispatchEvent(event);
      Assert.assertEquals(time.toString(), instance.timeView.timeTf.text);
    }
  }
}

import org.robotlegs.examples.gettime.service.ITimeService;
internal class TimeServiceMock implements ITimeService {
  public var isCalled:Boolean = false;
  public function getTime():void {
    isCalled = true;
  }
}
