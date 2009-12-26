package org.robotlegs.examples.gettime.service {
  import org.robotlegs.examples.gettime.events.TimeServiceEvent;
  import org.robotlegs.mvcs.Actor;
  /**
   * @author eidiot
   */
  public class LocalTimeService extends Actor implements ITimeService {
    //==========================================================================
    //  Public methods: ITimeService
    //==========================================================================
    public function getTime():void {
      dispatch(new TimeServiceEvent(TimeServiceEvent.TIME_RECEIVED, new Date()));
    }
  }
}
