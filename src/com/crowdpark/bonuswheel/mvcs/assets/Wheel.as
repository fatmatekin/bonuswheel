package com.crowdpark.bonuswheel.mvcs.assets
{
	import com.crowdpark.bonuswheel.mvcs.models.vo.WheelPartVo;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.spinner.SeparatorCircle;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author fatmatekin
	 */
	public class Wheel extends Sprite
	{
		public static const START_ROTATE : String = "START_ROTATE";
		public static const STOP_ROTATE : String = "STOP_ROTATE";
		
		private var _partsContainer : Sprite = new Sprite();
		private var _partsSpriteArray : Vector.<WheelPart>;
		private var _selectedSeperator : SeparatorCircle;

		public function createParts(wheelParts : Vector.<WheelPartVo>) : Sprite
		{
			for (var i : uint = 0;i < wheelParts.length;i++)
			{
				var wheelPart : WheelPart = new WheelPart();
				wheelPart.getCoinsField().text = String(wheelParts[i].getCoins());
				wheelPart.setRotation(wheelParts[i].getRotation());
				wheelPart.getSeperator().buttonMode = true;
				wheelPart.getSeperator().addEventListener(MouseEvent.MOUSE_DOWN, mouseDownSeperatorListener);
				
				_partsContainer.addChild(wheelPart);
				getPartsSpriteArray().push(wheelPart);
			}

			return _partsContainer;
		}

	
		private function mouseDownSeperatorListener(event : MouseEvent) : void
		{
			setSelectedSeperator(SeparatorCircle(event.currentTarget));
			dispatchEvent(new Event(Wheel.START_ROTATE));
		}

		private function setSelectedSeperator(currentTarget : SeparatorCircle) : void
		{
			_selectedSeperator = currentTarget;
		}

		public function getSelectedSeperator() : SeparatorCircle
		{
			return _selectedSeperator;
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
