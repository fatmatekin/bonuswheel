package com.crowdpark.bonuswheel.mvcs.views.gameview
{
	import com.crowdpark.bonuswheel.mvcs.models.WheelModel;
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
		[Inject]
		public var wheelModel : WheelModel;

		override public function onRegister() : void
		{
			super.onRegister();

			view.createWheel(wheelModel.getWheelPartsVector());

			addViewListener(GameView.DETECT_CURRENT_SCORE, onDetectCurrentScoreListener);

			addContextListener(GameEvent.START_GAME, onStartGameListener);
		}

		private function onDetectCurrentScoreListener(event : Event) : void
		{
			var gameEvent : GameEvent = new GameEvent(GameEvent.DETECT_CURRENT_SCORE);
			gameEvent.getDataProvider().setValueByKey('wheelRotation', view.getDataProvider().getValueByKey('wheelRotation'));
			dispatch(gameEvent);
		}

		private function onStartGameListener(event : GameEvent) : void
		{
		}

		public function get view() : GameView
		{
			return viewComponent as GameView;
		}
	}
}
