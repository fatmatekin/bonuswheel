package com.crowdpark.bonuswheel.mvcs.views.footerview
{
	import utils.draw.createRectangleShape;

	import com.crowdpark.bonuswheel.mvcs.assets.CustomButton;
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;
	import com.crowdpark.bonuswheel.mvcs.views.footerview.resultview.ResultView;
	import com.greensock.TweenMax;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author fatmatekin
	 */
	public class FooterView extends BaseView
	{
		public static const START_GAME_EVENT : String = "START_GAME_EVENT";
		public static const SHARE : String = "SHARE";
		public static const CONTINUE : String = "CONTINUE";
		private var _background : Shape;
		private var _startButton : CustomButton;
		private var resultButtonsContainer : Sprite = new Sprite();

		override public function onAddedToStageListener(event : Event) : void
		{
			super.onAddedToStageListener(event);

			_background.width = stage.stageWidth;
			_background.y = stage.stageHeight - _background.height;

			_startButton.x = (stage.stageWidth - _startButton.width) / 2;
			_startButton.y = stage.stageHeight - (_background.height - _startButton.height / 2);
		}

		public function addBackground() : void
		{
			_background = createRectangleShape(100, 100, 0xcacaca);
			addChild(_background);
		}

		public function addStartButton() : void
		{
			_startButton = new CustomButton();
			_startButton.setTitle('START');
			_startButton.addEventListener(MouseEvent.CLICK, onStartButtonListener);
			addChild(_startButton);
		}

		private function onStartButtonListener(event : MouseEvent) : void
		{
			dispatchEvent(new Event(FooterView.START_GAME_EVENT));
		}

		public function showResult(dailyBonus : uint, friendsBonus : uint, likeBonus : uint) : void
		{
			_background.height = 150;

			TweenMax.to(this, 1, {y:-50});

			var resultView : ResultView = new ResultView();
			resultView.setDailyBonusField(dailyBonus);
			resultView.setLikeField(likeBonus);
			resultView.setFriendsField(friendsBonus);
			resultView.setTotalWin(dailyBonus + friendsBonus + likeBonus);
			addChild(resultView);

			resultView.y = _background.y;
			resultView.x = (_background.width - resultView.width) / 2;

			addResultButtons();
		}

		private function addResultButtons() : void
		{
			var continueButton : CustomButton = new CustomButton();
			continueButton.setTitle('CONTINUE');
			continueButton.addEventListener(MouseEvent.CLICK, onContinueButtonListener);

			var shareButton : CustomButton = new CustomButton();
			shareButton.setTitle('SHARE');
			shareButton.addEventListener(MouseEvent.CLICK, onShareButtonListener);

			addChild(resultButtonsContainer);

			resultButtonsContainer.addChild(continueButton);
			resultButtonsContainer.addChild(shareButton);

			shareButton.x = continueButton.width + 20;

			resultButtonsContainer.x = (stage.stageWidth - resultButtonsContainer.width) / 2;
			resultButtonsContainer.y = _background.y + 80;
		}

		private function onShareButtonListener(event : MouseEvent) : void
		{
			dispatchEvent(new Event(FooterView.SHARE));
		}

		private function onContinueButtonListener(event : MouseEvent) : void
		{
			dispatchEvent(new Event(FooterView.CONTINUE));
		}

		public function closeFooter() : void
		{
			TweenMax.to(this, 1, {y:_background.height});
			removeChild(_startButton);
		}
	}
}
