package com.crowdpark.bonuswheel.mvcs.models
{
	import com.crowdpark.bonuswheel.mvcs.events.GameEvent;

	import utils.array.randomize;

	import com.crowdpark.bonuswheel.mvcs.models.vo.WheelPartVo;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author fatmatekin
	 */
	public class WheelModel extends Actor
	{
		private var _wheelParts : Array = [150, 200, 250, 300, 350, 400, 550, 600, 650, 700, 750, 800, 900, 1000, 3000];
		private var _wheelPartsVector : Vector.<WheelPartVo>;
		private var _wheelRotation : int;
		private var _closestWheel : WheelPartVo;
		private var _minDifference : uint = 360;

		public function createWheelPartVos() : WheelModel
		{
			var randomizedArr : Array = randomize(_wheelParts);
			for (var i : uint = 0;i < randomizedArr.length;i++)
			{
				var wheelPart : WheelPartVo = new WheelPartVo();
				wheelPart.setCoins(randomizedArr[i]);
				wheelPart.setRotation(i * (360 / randomizedArr.length));
				getWheelPartsVector().push(wheelPart);
			}
			return this;
		}

		public function getWheelPartsVector() : Vector.<WheelPartVo>
		{
			if (!_wheelPartsVector)
			{
				_wheelPartsVector = new Vector.<WheelPartVo>();
			}
			return _wheelPartsVector;
		}

		public function setWheelPartsVector(wheelPartsVector : Vector.<WheelPartVo>) : WheelModel
		{
			_wheelPartsVector = wheelPartsVector;
			return this;
		}

		public function setWheelRotation(wheelRotation : int) : void
		{
			_wheelRotation = wheelRotation;
		}

		public function getWheelRotation() : int
		{
			return _wheelRotation;
		}

		public function detectCurrentWheelPart() : void
		{
			var wheelParts : Vector.<WheelPartVo> = getWheelPartsVector();

			var wheelRotation : int = getWheelRotation();
			for (var i : uint = 0;i < wheelParts.length;i++)
			{
				var partRotation : int = wheelParts[i].getRotation();
				var difference : int = Math.abs(wheelRotation - partRotation);
				if (difference < _minDifference)
				{
					setClosestWheelPart(wheelParts[i]);
					_minDifference = difference;
				}
			}

			var gameEvent : GameEvent = new GameEvent(GameEvent.SET_CURRENT_SCORE);
			gameEvent.getDataProvider().setValueByKey('currentScore', uint(getClosestWheelPart().getCoins()));
			dispatch(gameEvent);

			trace(getClosestWheelPart().getCoins());
		}

		private function setClosestWheelPart(wheelPart : WheelPartVo) : void
		{
			_closestWheel = wheelPart;
		}

		private function getClosestWheelPart() : WheelPartVo
		{
			return _closestWheel ;
		}
	}
}
