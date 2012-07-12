package com.crowdpark.bonuswheel.mvcs.views.gameview.initializers.base
{
	import com.crowdpark.bonuswheel.mvcs.interfaces.InterfaceSpinInitializer;

	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public class BaseInitializer extends Sprite implements InterfaceSpinInitializer
	{
		private var _newMouseX : Number;
		private var _newMouseY : Number;
		private var _oldMouseY : Number;
		private var _oldMouseX : Number;
		private var _velocity : Number;
		private var _dragObject : Sprite;
		private var _rotationWay : String;
		private var _minSpeed : Number = 1;
		private var _maxSpeed : Number = 20;

		public function calculateVelocity() : Number
		{
			_newMouseX = mouseX;
			_newMouseY = mouseY;

			var distanceX : Number = _newMouseX - _oldMouseX;
			var distanceY : Number = _newMouseY - _oldMouseY;

			_velocity = Math.sqrt(Math.pow(distanceX, 2) + Math.pow(distanceY, 2));

			_oldMouseX = _newMouseX;
			_oldMouseY = _newMouseY;

			return _velocity;
		}

		public function rotateWithInitializer(dragObject : Sprite, spinObject : Sprite) : void
		{
		}

		public function getOldMouseX() : Number
		{
			return _oldMouseX;
		}

		public function getDragObject() : Sprite
		{
			return _dragObject;
		}

		public function setDragObject(dragObject : Sprite) : InterfaceSpinInitializer
		{
			_dragObject = dragObject;
			return this;
		}

		public function setRotationWay() : void
		{
			if ( mouseX < _oldMouseX)
			{
				_rotationWay = 'left';
			}
			else
			{
				_rotationWay = 'right';
			}
		}

		public function getRotationWay() : String
		{
			return _rotationWay;
		}

		public function checkSpeed() : Number
		{
			if (_velocity < _minSpeed)
			{
				_velocity = _minSpeed;
			}
			if (_velocity > _maxSpeed)
			{
				_velocity = _maxSpeed;
			}
			return _velocity;
		}
	}
}
