package com.crowdpark.bonuswheel.mvcs.assets
{
	import utils.textField.createField;

	import com.crowdpark.bonuswheel.mvcs.views.gameview.spinner.SeparatorCircle;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	/**
	 * @author fatmatekin
	 */
	public class WheelPart extends Sprite
	{
		private var FontVerdana : Class = Assets.FONT_VERDANA;
		private var WheelBackground : Class = Assets.WHEEL_BACKGROUND;
		private var _background : Bitmap;
		private var _coinsField : TextField;
		private var _seperator : SeparatorCircle;

		public function WheelPart()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStageListener);

			addChild(getBackground());
			addChild(getCoinsField());
			addChild(getSeperator());
		}

		private function onAddedToStageListener(event : Event) : void
		{
			_coinsField.x = _background.width - _coinsField.width - 20;
			_coinsField.y = (-_coinsField.height) / 2;

			_seperator.x = _background.width;
			_seperator.y = _background.y;
		}

		public function getCoinsField() : TextField
		{
			if (!_coinsField)
			{
				_coinsField = createField('ss', 0, 0, 200, 20, false, "Verdana", 20, 0xffffff);
				_coinsField.embedFonts = true;
				_coinsField.cacheAsBitmap = true;
			}
			return _coinsField;
		}

		public function setCoinsField(coinsField : TextField) : void
		{
			_coinsField = coinsField;
		}

		public function getBackground() : Bitmap
		{
			if (!_background)
			{
				_background = new WheelBackground();
				_background.y = -_background.height / 2;
			}

			return _background;
		}

		public function setBackground(background : Bitmap) : void
		{
			_background = background;
		}

		public function setRotation(rotationVal : int) : void
		{
			this.rotation = rotationVal;
			_seperator.setRotation(rotationVal);
		}

		public function getRotation() : int
		{
			return this.rotation;
		}

		public function getSeperator() : SeparatorCircle
		{
			if (!_seperator)
			{
				_seperator = new SeparatorCircle();
			}

			return _seperator;
		}
	}
}
