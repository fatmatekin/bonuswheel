package com.crowdpark.bonuswheel.mvcs
{
	import com.crowdpark.bonuswheel.mvcs.commands.ContinueCommand;
	import com.crowdpark.bonuswheel.mvcs.commands.SetCurrentScoreCommand;
	import com.crowdpark.bonuswheel.mvcs.commands.ShareResultCommand;
	import com.crowdpark.bonuswheel.mvcs.commands.StartupCompleteCommand;
	import com.crowdpark.bonuswheel.mvcs.events.GameEvent;
	import com.crowdpark.bonuswheel.mvcs.models.DataModel;
	import com.crowdpark.bonuswheel.mvcs.models.ScoreModel;
	import com.crowdpark.bonuswheel.mvcs.views.footerview.FooterView;
	import com.crowdpark.bonuswheel.mvcs.views.footerview.FooterViewMediator;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.GameView;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.GameViewMediator;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;



	/**
	 * @author fatmatekin
	 */
	public class BonusWheelContext extends Context
	{
		public function BonusWheelContext(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup() : void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand);
			commandMap.mapEvent(GameEvent.SET_CURRENT_SCORE, SetCurrentScoreCommand);
			commandMap.mapEvent(GameEvent.SHARE_RESULT, ShareResultCommand);
			commandMap.mapEvent(GameEvent.CONTINUE, ContinueCommand);
			
			injector.mapSingleton(DataModel);
			injector.mapSingleton(ScoreModel);
			
			mediatorMap.mapView(FooterView, FooterViewMediator);
			mediatorMap.mapView(GameView, GameViewMediator);
			super.startup();
		}
	}
}
