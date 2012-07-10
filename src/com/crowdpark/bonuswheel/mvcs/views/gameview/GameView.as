package com.crowdpark.bonuswheel.mvcs.views.gameview
{
	import com.crowdpark.bonuswheel.mvcs.assets.Wheel;
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;
	import com.crowdpark.bonuswheel.mvcs.models.vo.WheelPartVo;
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class GameView extends BaseView
	{
		public static const DETECT_CURRENT_SCORE : String = "DETECT_CURRENT_SCORE";
		private var Stopper : Class = Assets.STOPPER;
		private var _wheelContainer : Sprite = new Sprite();
		private var _wheel : Wheel;
		private var _speed : int = 150;
		private var _wheelStopper : Bitmap;

		public function init() : void
		{
			_wheelStopper = new Stopper();
			addChild(_wheelContainer);
			addChild(_wheelStopper);
		}

		override public function onAddedToStageListener(event : Event) : void
		{
			super.onAddedToStageListener(event);
			_wheelStopper.x = (stage.stageWidth - _wheelStopper.width) / 2;

			_wheelContainer.x = (stage.stageWidth / 2);
			_wheelContainer.y = (stage.stageHeight / 2);
		}

		public function createWheel(wheelParts : Vector.<WheelPartVo>) : void
		{
			getDataProvider().setValueByKey('wheelArray', wheelParts);

			_wheel = new Wheel();
			_wheelContainer.addChild(_wheel.createParts(wheelParts));
		}

		public function getWheelContiner() : Sprite
		{
			return _wheelContainer;
		}

		public function startSpin() : void
		{
			// doTween();
			addEventListener(Event.ENTER_FRAME, onEnterFrameListener);
		}

		private function onEnterFrameListener(event : Event) : void
		{
		}

		private function doTween() : void
		{
			_speed -= 15;

			if (_speed > 0)
			{
				TweenMax.to(_wheelContainer, 0.5, {rotationZ:'+' + String(_speed), onComplete:doTween, ease:Linear.easeNone});
			}
			else
			{
				_speed = 100;
				detectWheelRotation();
			}
		}

		private function detectWheelRotation() : void
		{
			var wheelRotation : int = _wheelContainer.rotation;
			getDataProvider().setValueByKey('wheelRotation', wheelRotation);
			dispatchEvent(new Event(GameView.DETECT_CURRENT_SCORE));
		}
	}
}
