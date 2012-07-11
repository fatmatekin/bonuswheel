package com.crowdpark.bonuswheel.mvcs.views.footerview
{
	import com.crowdpark.bonuswheel.mvcs.models.DataModel;
	import com.crowdpark.bonuswheel.mvcs.models.ScoreModel;
	import com.crowdpark.bonuswheel.mvcs.events.GameEvent;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class FooterViewMediator extends Mediator
	{
		[Inject]
		public var scoreModel : ScoreModel;
		[Inject]
		public var dataModel : DataModel;

		override public function onRegister() : void
		{
			super.onRegister();
			view.addBackground();
			//view.addStartButton();

			addViewListener(FooterView.START_GAME_EVENT, onStartGameListener);
			addViewListener(FooterView.SHARE, onShareResultListener);
			addViewListener(FooterView.CONTINUE, onContinueGameListener);

			addContextListener(GameEvent.SHOW_RESULT, onShowResultListener);
		}

		private function onContinueGameListener(event : Event) : void
		{
			dispatch(new GameEvent(GameEvent.CONTINUE));
		}

		private function onShareResultListener(event : Event) : void
		{
			dispatch(new GameEvent(GameEvent.SHARE_RESULT));
		}

		private function onShowResultListener(event : GameEvent) : void
		{
			view.showResult(scoreModel.getDailybonus(), dataModel.getFriendsBonus(), dataModel.getLikeBonus());
		}

		private function onStartGameListener(event : Event) : void
		{
			view.closeFooter();
			dispatch(new GameEvent(GameEvent.START_GAME));
		}

		private function get view() : FooterView
		{
			return viewComponent as FooterView;
		}
	}
}
