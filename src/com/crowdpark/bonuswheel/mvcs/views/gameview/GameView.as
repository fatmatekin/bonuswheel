package com.crowdpark.bonuswheel.mvcs.views.gameview
{
	import com.crowdpark.bonuswheel.mvcs.assets.DragObject;
	import com.crowdpark.bonuswheel.mvcs.assets.Wheel;
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;
	import com.crowdpark.bonuswheel.mvcs.models.vo.WheelPartVo;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.spinner.WheelSpinner;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class GameView extends BaseView
	{
		public static const DETECT_CURRENT_SCORE : String = "DETECT_CURRENT_SCORE";
		private var Stopper : Class = Assets.STOPPER;
		private var _wheelContainer : Sprite = new Sprite();
		private var _wheel : Wheel;
		private var _wheelStopper : Sprite;
		private var _dragObject : Sprite;
		private var _wheelSpinner : WheelSpinner;

		public function init() : void
		{
			_wheelStopper = new Sprite();
			_wheelStopper.addChild(new Stopper());

			_wheelSpinner = new WheelSpinner();
			_wheelSpinner.setStoppper(_wheelStopper);
			_wheelSpinner.addEventListener(WheelSpinner.WHEEL_STOP, detectWheelRotation);

			addChild(_wheelContainer);
			addChild(_wheelStopper);
		}

		override public function onAddedToStageListener(event : Event) : void
		{
			super.onAddedToStageListener(event);
			_wheelSpinner.setStage(stage);

			_wheelStopper.x = (stage.stageWidth - _wheelStopper.width) / 2;

			_wheelContainer.x = (stage.stageWidth / 2);
			_wheelContainer.y = (stage.stageHeight / 2);

			_dragObject.x = _wheelContainer.x;
			_dragObject.y = _wheelContainer.y - 150;
		}

		public function createWheel(wheelParts : Vector.<WheelPartVo>) : void
		{
			getDataProvider().setValueByKey('wheelArray', wheelParts);

			_wheel = new Wheel();
			_wheel.addEventListener(Wheel.START_ROTATE, onStartRotateBySeperatorListener);
			_wheelContainer.addChild(_wheel.createParts(wheelParts));

			_wheelSpinner.setSpinObject(_wheelContainer);

			addDragObject();
		}

		public function addDragObject() : void
		{
			_dragObject = new DragObject();
			addChild(_dragObject);

			_wheelSpinner.setDragObject(_dragObject);
		}

		private function onStartRotateBySeperatorListener(event : Event) : void
		{
			_wheelSpinner.rotateBySeperator(_wheel.getSelectedSeperator());
		}

		private function detectWheelRotation(event : Event) : void
		{
			var wheelRotation : int = Math.round(_wheelContainer.rotation);
			getDataProvider().setValueByKey('wheelRotation', wheelRotation);
			dispatchEvent(new Event(GameView.DETECT_CURRENT_SCORE));
		}
	}
}
