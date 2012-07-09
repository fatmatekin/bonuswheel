package com.crowdpark.bonuswheel.mvcs.assets
{
	import utils.textField.createField;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	/**
	 * @author fatmatekin
	 */
	public class SingleResult extends Sprite
	{
		private var _coinAmountField : TextField;
		private var _coinsText : TextField;
		private var _typeField : TextField;

		public function SingleResult()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStageListener);

			_coinAmountField = createField('', 0, 0, 200, 20, true, 'Verdana', 15, 0x7f007f, 'left');
			_coinsText = createField('COINS', 0, 0, 200, 20, true, 'Verdana', 10, 0x7f007f, 'left');
			_typeField = createField('', 0, 0, 200, 20, true, 'Verdana', 15, 0x7f007f, 'left');

			addChild(_coinAmountField);
			addChild(_coinsText);
			addChild(_typeField);
		}

		private function onAddedToStageListener(event : Event) : void
		{
			_coinsText.y = _coinAmountField.height + 2;
			_typeField.y = _coinsText.y + _coinsText.height + 2;
		}

		public function getCoinAmountField() : TextField
		{
			return _coinAmountField;
		}

		public function setCoinAmountFieldText(coins : String) : void
		{
			_coinAmountField.text = coins;
		}

		public function getTypeField() : TextField
		{
			return _typeField;
		}

		public function setTypeFieldText(type : String) : void
		{
			_typeField.text = type;
		}
	}
}
