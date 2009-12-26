package org.robotlegs.examples.gettime.events {
  import flash.events.Event;
  /**
   * @author eidiot
   */
  public class TimeServiceEvent extends Event {
    //==========================================================================
    //  Class constants
    //==========================================================================
    public static const TIME_RECEIVED:String = "timeReceived";
    //==========================================================================
    //  Constructor
    //==========================================================================
    public function TimeServiceEvent(type:String, time:Date) {
      super(type);
      _time = time;
    }
    //==========================================================================
    //  Properties
    //==========================================================================
    //----------------------------------
    //  time
    //----------------------------------
    private var _time:Date;
    public function get time():Date {
      return _time;
    }
  }
}
