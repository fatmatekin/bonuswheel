package com.crowdpark.bonuswheel.mvcs.views.gameview.spinner
{
	import flash.display.Shape;

	import utils.draw.createCircleShape;

	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public class SeparatorCircle extends Sprite
	{
		private var _seperator : Sprite;
		private var _rotation : int;

		public function SeparatorCircle()
		{
			var shape : Shape = createCircleShape(10, 0xff0000, 1, 0,0);
			_seperator = new Sprite();
			_seperator.addChild(shape);
			addChild(_seperator);
		}

		public function setRotation(rotationVal : int) : SeparatorCircle
		{
			_rotation = rotationVal;
			return this;
		}

		public function getRotation() : int
		{
			return _rotation;
		}
	}
}
