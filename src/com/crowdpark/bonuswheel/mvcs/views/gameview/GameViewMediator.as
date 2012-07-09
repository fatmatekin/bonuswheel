package com.crowdpark.bonuswheel.mvcs.views.gameview
{
	import com.crowdpark.bonuswheel.mvcs.models.ScoreModel;

	import flash.events.Event;

	import com.crowdpark.bonuswheel.mvcs.events.GameEvent;
	import com.crowdpark.bonuswheel.mvcs.models.DataModel;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author fatmatekin
	 */
	public class GameViewMediator extends Mediator
	{
		[Inject]
		public var dataModel : DataModel;
		[Inject]
		public var scoreModel : ScoreModel;

		override public function onRegister() : void
		{
			super.onRegister();

			view.createWheel(dataModel.getWheelParts());

			addViewListener(GameView.SET_CURRENT_SCORE, onSetCurrentScoreListener);
			addContextListener(GameEvent.START_GAME, onStartGameListener);
		}

		private function onSetCurrentScoreListener(event : Event) : void
		{
			var gameEvent : GameEvent = new GameEvent(GameEvent.SET_CURRENT_SCORE);
			gameEvent.getDataProvider().setValueByKey('currentScore', uint(view.getDataProvider().getValueByKey('currentScore')));
			dispatch(gameEvent);
		}

		private function onStartGameListener(event : GameEvent) : void
		{
			view.startSpin();
		}

		public function get view() : GameView
		{
			return viewComponent as GameView;
		}
	}
}
