package com.crowdpark.bonuswheel.mvcs.views.gameview
{
	import com.crowdpark.bonuswheel.mvcs.assets.Wheel;
	import com.crowdpark.bonuswheel.mvcs.assets.WheelPart;
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;
	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;

	/**
	 * @author fatmatekin
	 */
	public class GameView extends BaseView
	{
		public static const SET_CURRENT_SCORE : String = "SET_CURRENT_SCORE";
		private var Stopper : Class = Assets.STOPPER;
		private var _wheelContainer : Sprite = new Sprite();
		private var _wheel : Wheel;
		private var _speed : int = 150;
		private var _wheelStopper : Bitmap;
		private var _stopperPoint : Point;
		private var _closest : WheelPart;
		private var _minDistance : uint;

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
			_stopperPoint = new Point(_wheelStopper.x + (_wheelStopper.width / 2), _wheelStopper.height);

			_wheelContainer.x = (stage.stageWidth / 2);
			_wheelContainer.y = (stage.stageHeight / 2);
		}

		public function createWheel(arr : Array) : void
		{
			getDataProvider().setValueByKey('wheelArray', arr);

			_wheel = new Wheel();
			_wheelContainer.addChild(_wheel.createParts(arr));
		}

		public function getWheelContiner() : Sprite
		{
			return _wheelContainer;
		}

		public function startSpin() : void
		{
			doTween();
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
				detectWonAmount();
			}
		}

		private function detectWonAmount() : void
		{
			var wheelArray : Vector.<WheelPart> = _wheel.getPartsSpriteArray();
			_minDistance = 500;
			for (var i : uint = 0;i < wheelArray.length;i++)
			{
				var wheelPart : WheelPart = wheelArray[i];
				var indicatorPoint : Point = wheelPart.getIndicator();

				var distance = Point.distance(_stopperPoint, wheelPart.localToGlobal(indicatorPoint));
				if (distance < _minDistance)
				{
					_minDistance = distance;
					setClosest(wheelPart);
				}
			}

			getDataProvider().setValueByKey('currentScore', uint(getClosest().getCoinsField().text));
			dispatchEvent(new Event(GameView.SET_CURRENT_SCORE));
		}

		public function getClosest() : WheelPart
		{
			return _closest;
		}

		public function setClosest(closest : WheelPart) : void
		{
			_closest = closest;
		}
	}
}
