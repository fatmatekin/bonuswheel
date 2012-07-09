package com.crowdpark.bonuswheel.mvcs.assets
{
	import utils.textField.createField;

	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author fatmatekin
	 */
	public class CustomButton extends Sprite
	{
		private var _background : Shape;
		private var _label : String;
		private var _labelTextField : TextField;
		private var _mouseUpColor : uint = 0x7f007f;
		private var _mouseDownColor : uint = 0xff0000;
		private var _mouseOverColor : uint = 0xffff00;
		private var _currentStateColor : uint;
		private var _title : String;

		public function CustomButton()
		{
			mouseChildren = false;
			buttonMode = true;
			setCurrentStateColor(getMouseUpColor());

			addEventListener(MouseEvent.CLICK, onMouseClickListener);
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOverListener);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseUpListener);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStageListener);
		}

		private function onAddedToStageListener(event : Event) : void
		{
			createChildren();
		}

		public function createChildren() : void
		{
			addChild(drawBackground(getMouseUpColor()));
			addChild(createLabelText(getLabel()));
			updateButton();
		}

		private function updateButton() : void
		{
			drawBackground(getCurrentStateColor());

			var textfield : TextField = getLabelTextField();
			textfield.text = getLabel();
			textfield.x = (getBackground().width - textfield.width) / 2;
			textfield.y = (getBackground().height - textfield.height) / 2;
		}

		private function onMouseUpListener(event : MouseEvent) : void
		{
			setCurrentStateColor(getMouseUpColor());
			setLabel(getTitle());
			updateButton();
		}

		private function onMouseOverListener(event : MouseEvent) : void
		{
			setCurrentStateColor(getMouseOverColor());
			setLabel('mouse over');
			updateButton();
		}

		private function onMouseClickListener(event : MouseEvent) : void
		{
			setCurrentStateColor(getMouseDownColor());
			setLabel('mouse down');
			updateButton();
		}

		private function createLabelText(label : String) : DisplayObject
		{
			if (!_labelTextField)
			{
				_labelTextField = createField(label, 0, 0, 200, 20, false, 'Verdana');
			}
			_labelTextField.text = label;

			return _labelTextField;
		}

		private function drawBackground(color : uint) : Shape
		{
			if (!_background)
			{
				_background = new Shape();
			}
			_background.graphics.beginFill(color);
			_background.graphics.drawRect(0, 0, 157, 43);
			_background.graphics.endFill();
			return _background;
		}

		public function getLabel() : String
		{
			if (!_label)
			{
				_label = '';
			}
			return _label;
		}

		public function setLabel(label : String) : CustomButton
		{
			this._label = label;
			return this;
		}

		public function getMouseUpColor() : uint
		{
			return _mouseUpColor;
		}

		public function setMouseUpColor(mouseUpColor : uint) : CustomButton
		{
			this._mouseUpColor = mouseUpColor;
			return this;
		}

		public function getMouseDownColor() : uint
		{
			return _mouseDownColor;
		}

		public function setMouseDownColor(mouseDownColor : uint) : CustomButton
		{
			_mouseDownColor = mouseDownColor;
			return this;
		}

		public function getMouseOverColor() : uint
		{
			return _mouseOverColor;
		}

		public function setMouseOverColor(mouseOverColor : uint) : CustomButton
		{
			_mouseOverColor = mouseOverColor;
			return this;
		}

		public function getBackground() : Shape
		{
			return _background;
		}

		public function setBackground(background : Shape) : CustomButton
		{
			_background = background;
			return this;
		}

		public function getLabelTextField() : TextField
		{
			if (!_labelTextField)
			{
				_labelTextField = new TextField();
			}
			return _labelTextField;
		}

		public function setLabelTextField(labelTextField : TextField) : void
		{
			_labelTextField = labelTextField;
		}

		public function getCurrentStateColor() : uint
		{
			return _currentStateColor;
		}

		public function setCurrentStateColor(currentStateColor : uint) : void
		{
			this._currentStateColor = currentStateColor;
		}

		public function setTitle(title : String) : void
		{
			_title = title;
			setLabel(_title);
		}

		public function getTitle() : String
		{
			return _title;
		}
	}
}
