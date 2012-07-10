package com.crowdpark.bonuswheel.mvcs.assets
{
	import com.crowdpark.bonuswheel.mvcs.models.vo.WheelPartVo;

	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public class Wheel extends Sprite
	{
		private var _partsContainer : Sprite = new Sprite();
		private var _partsSpriteArray : Vector.<WheelPart>;

		public function createParts(wheelParts : Vector.<WheelPartVo>) : Sprite
		{
			for (var i : uint = 0;i < wheelParts.length;i++)
			{
				var wheelPart : WheelPart = new WheelPart();
				wheelPart.getCoinsField().text = String(wheelParts[i].getCoins());
				wheelPart.setRotation(wheelParts[i].getRotation());

				_partsContainer.addChild(wheelPart);
				getPartsSpriteArray().push(wheelPart);
			}

			return _partsContainer;
		}

		public function getPartsContainer() : Sprite
		{
			return _partsContainer;
		}

		public function getPartsSpriteArray() : Vector.<WheelPart>
		{
			if (!_partsSpriteArray)
			{
				_partsSpriteArray = new Vector.<WheelPart>();
			}
			return _partsSpriteArray;
		}

		public function setPartsSpriteArray(partsSpriteArray : Vector.<WheelPart>) : void
		{
			_partsSpriteArray = partsSpriteArray;
		}
	}
}
