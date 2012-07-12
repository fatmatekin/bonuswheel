package com.crowdpark.bonuswheel.mvcs.views.gameview.spinner
{
	import com.crowdpark.bonuswheel.mvcs.interfaces.InterfaceSpinInitializer;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.initializers.DragInitializer;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.initializers.SeparatorInitializer;

	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author fatmatekin
	 */
	public class WheelSpinner extends Sprite
	{
		public static const WHEEL_STOP : String = "WHEEL_STOP";
		public static const SEPERATOR : String = "SEPERATOR";
		public  static const DRAG_OBJECT : String = "DRAG_OBJECT";
		private var _spinInitializerObject : InterfaceSpinInitializer;
		private var _stage : DisplayObjectContainer;
		private var _dragObject : Sprite;
		private var _spinObject : Sprite;
		private var _wheelStopper : Sprite;
		// Spin Calculation
		private var _speed : Number;
		private var _friction : Number = 0.98;

		public function setSpinObject(object : Sprite) : void
		{
			_spinObject = object;
		}

		public function getSpinObject() : Sprite
		{
			return _spinObject;
		}

		public function setStage(obj : DisplayObjectContainer) : void
		{
			_stage = obj;
		}

		public function setDragObject(object : Sprite) : void
		{
			_dragObject = object;
			_dragObject.addEventListener(MouseEvent.MOUSE_DOWN, onStartDragListener);
		}

		public function onStartDragListener(event : MouseEvent) : void
		{
			var initializer : DragInitializer = DragInitializer(new DragInitializer().setDragObject(_dragObject));
			setSpinInitializerObject(initializer);
			initializer.startDragObject();

			addStageDragListeners();
		}

		public function rotateBySeperator(seperator : SeparatorCircle) : void
		{
			setSpinInitializerObject(new SeparatorInitializer().setDragObject(seperator));

			addStageDragListeners();
		}

		private function addStageDragListeners() : void
		{
			_stage.addEventListener(MouseEvent.MOUSE_UP, onStopDragListener);
			_stage.addEventListener(Event.ENTER_FRAME, onDragEnterFrameListener);
		}

		private function onDragEnterFrameListener(event : Event) : void
		{
			getSpinInitializerObject().rotateWithInitializer(getSpinInitializerObject().getDragObject(), _spinObject);

			_speed = getSpinInitializerObject().calculateVelocity();
		}

		private function onStopDragListener(event : MouseEvent) : void
		{
			getSpinInitializerObject().getDragObject().stopDrag();
			getSpinInitializerObject().getDragObject().removeEventListener(MouseEvent.MOUSE_DOWN, onStartDragListener);

			removeStageDragListeners();

			getSpinInitializerObject().setRotationWay();
			_speed = getSpinInitializerObject().checkSpeed();

			_stage.addEventListener(Event.ENTER_FRAME, onSpinWheelListener);
		}

		private function removeStageDragListeners() : void
		{
			_stage.removeEventListener(Event.ENTER_FRAME, onDragEnterFrameListener);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, onStopDragListener);
		}

		private function onSpinWheelListener(event : Event) : void
		{
			if (getSpinInitializerObject().getRotationWay() == 'left')
			{
				_spinObject.rotation -= _speed;
			}
			else if (getSpinInitializerObject().getRotationWay() == 'right')
			{
				_spinObject.rotation += _speed;
			}

			_speed *= _friction;

			if (_speed < 0.5)
			{
				_stage.removeEventListener(Event.ENTER_FRAME, onSpinWheelListener);
				dispatchEvent(new Event(WheelSpinner.WHEEL_STOP));
			}
		}

		public function setStoppper(wheelStopper : Sprite) : void
		{
			_wheelStopper = wheelStopper;
		}

		public function getStoppper() : Sprite
		{
			return _wheelStopper;
		}

		public function getSpinInitializerObject() : InterfaceSpinInitializer
		{
			return _spinInitializerObject;
		}

		public function setSpinInitializerObject(spinInitializerObject : InterfaceSpinInitializer) : void
		{
			_spinInitializerObject = spinInitializerObject;
		}
	}
}
