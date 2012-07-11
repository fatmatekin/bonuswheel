package com.crowdpark.bonuswheel.mvcs.views.gameview.spinner {
	import flash.display.Bitmap;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	/**
	 * @author fatmatekin
	 */
	public class WheelSpinner extends Sprite {
		public static const WHEEL_STOP : String = "WHEEL_STOP";
		private var _stage : DisplayObjectContainer;
		private var _dragObject : Sprite;
		private var _spinObject : Sprite;
		private var _wheelStopper : Bitmap;
		// Spin Calculation
		private var _newMouseX : Number;
		private var _oldMouseX : Number;
		private var _speed : Number;
		private var _minSpeed : Number = 1;
		private var _maxSpeed : Number = 20;
		private var _friction : Number = 0.98;
		private var _rotationWay : String;

		public function setSpinObject(object : Sprite) : void {
			_spinObject = object;
		}

		public function getSpinObject() : Sprite {
			return _spinObject;
		}

		public function setStage(obj : DisplayObjectContainer) : void {
			_stage = obj;
		}

		public function setDragObject(object : Sprite) : void {
			_dragObject = object;
			_dragObject.addEventListener(MouseEvent.MOUSE_DOWN, onStartDragListener);
		}

		public function onStartDragListener(event : MouseEvent) : void {
			_dragObject.startDrag(false, new Rectangle(_dragObject.x - _dragObject.width, _dragObject.y, 200, 0));

			_stage.addEventListener(Event.ENTER_FRAME, onDragEnterFrameListener);
			_stage.addEventListener(MouseEvent.MOUSE_UP, onStopDragListener);
		}

		private function onDragEnterFrameListener(event : Event) : void {
			_spinObject.rotation = _dragObject.x - _spinObject.x;

			_newMouseX = mouseX;
			_speed = Math.abs(_newMouseX - _oldMouseX);
			_oldMouseX = _newMouseX;
		}

		private function onStopDragListener(event : MouseEvent) : void {
			_dragObject.stopDrag();

			_dragObject.removeEventListener(MouseEvent.MOUSE_DOWN, onStartDragListener);
			_stage.removeEventListener(Event.ENTER_FRAME, onDragEnterFrameListener);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, onStopDragListener);

			setRotationWay();
			checkSpeed();
			_stage.addEventListener(Event.ENTER_FRAME, onSpinWheelListener);
		}

		private function onSpinWheelListener(event : Event) : void {
			if (_rotationWay == 'left') {
				_spinObject.rotation -= _speed;
			} else if (_rotationWay == 'right') {
				_spinObject.rotation += _speed;
			}
			_speed *= _friction;

			if (_speed < 0.5) {
				_stage.removeEventListener(Event.ENTER_FRAME, onSpinWheelListener);
				dispatchEvent(new Event(WheelSpinner.WHEEL_STOP));
			}
		}

		private function checkSpeed() : void {
			if (_speed < _minSpeed) {
				_speed = _minSpeed;
			}
			if (_speed > _maxSpeed) {
				_speed = _maxSpeed;
			}
		}

		private function setRotationWay() : void {
			if ( mouseX < _oldMouseX) {
				_rotationWay = 'left';
			} else {
				_rotationWay = 'right';
			}
		}

		public function setStoppper(wheelStopper : Bitmap) : void {
			_wheelStopper = wheelStopper;
		}
	}
}
