package org.robotlegs.examples.gettime.view {
  import org.robotlegs.examples.gettime.events.TimeServiceEvent;
  import org.robotlegs.examples.gettime.service.ITimeService;
  import org.robotlegs.mvcs.Mediator;
  /**
   * @author eidiot
   */
  public class TimeViewMediator extends Mediator {
    //==========================================================================
    //  Dependencies
    //==========================================================================
    [Inject]
    public var timeView:TimeView;
    [Inject]
    public var timeService:ITimeService;
    //==========================================================================
    //  Overridden methods
    //==========================================================================
    override public function onRegister():void {
      eventMap.mapListener(eventDispatcher, TimeServiceEvent.TIME_RECEIVED, timeReceivedHandler);
      timeService.getTime();
    }
    //==========================================================================
    //  Event handlers
    //==========================================================================
    private function timeReceivedHandler(event:TimeServiceEvent):void {
      timeView.update(event.time);
    }
  }
}
