package org.robotlegs.examples.gettime {
  import org.robotlegs.examples.gettime.service.ITimeService;
  import org.robotlegs.examples.gettime.service.LocalTimeService;
  import org.robotlegs.examples.gettime.view.TimeView;
  import org.robotlegs.examples.gettime.view.TimeViewMediator;
  import org.robotlegs.mvcs.Context;

  import flash.display.DisplayObjectContainer;
  /**
   * Context of the small example.
   *
   * @author eidiot
   */
  public class GetTimeContext extends Context {
    //==========================================================================
    //  Constructor
    //==========================================================================
    public function GetTimeContext(contextView:DisplayObjectContainer) {
      super(contextView);
    }
    //==========================================================================
    //  Overridden methods
    //==========================================================================
    override public function startup():void {
      injector.mapSingletonOf(ITimeService, LocalTimeService);
      mediatorMap.mapView(TimeView, TimeViewMediator);
      contextView.addChild(new TimeView());
    }
  }
}