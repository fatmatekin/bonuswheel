package com.crowdpark.bonuswheel.mvcs.views.gameview {
	import com.crowdpark.bonuswheel.mvcs.assets.DragObject;
	import com.crowdpark.bonuswheel.mvcs.assets.Wheel;
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;
	import com.crowdpark.bonuswheel.mvcs.models.vo.WheelPartVo;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.spinner.WheelSpinner;

	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class GameView extends BaseView {
		public static const DETECT_CURRENT_SCORE : String = "DETECT_CURRENT_SCORE";
		private var Stopper : Class = Assets.STOPPER;
		private var _wheelContainer : Sprite = new Sprite();
		private var _wheel : Wheel;
		private var _wheelStopper : Bitmap;
		private var _dragObject : Sprite;

		public function init() : void {
			_wheelStopper = new Stopper();

			addChild(_wheelContainer);
			addChild(_wheelStopper);
		}

		override public function onAddedToStageListener(event : Event) : void {
			super.onAddedToStageListener(event);
			_wheelStopper.x = (stage.stageWidth - _wheelStopper.width) / 2;

			_wheelContainer.x = (stage.stageWidth / 2);
			_wheelContainer.y = (stage.stageHeight / 2);

			_dragObject.x = _wheelContainer.x;
			_dragObject.y = _wheelContainer.y - 150;
		}

		public function createWheel(wheelParts : Vector.<WheelPartVo>) : void {
			getDataProvider().setValueByKey('wheelArray', wheelParts);

			_wheel = new Wheel();
			_wheelContainer.addChild(_wheel.createParts(wheelParts));

			addDragObject();
		}

		public function addDragObject() : void {
			_dragObject = new DragObject();
			addChild(_dragObject);

			var wheelSpinner : WheelSpinner = new WheelSpinner();
			wheelSpinner.setDragObject(_dragObject);
			wheelSpinner.setSpinObject(_wheelContainer);
			wheelSpinner.setStage(stage);
			wheelSpinner.setStoppper(_wheelStopper);

			wheelSpinner.addEventListener(WheelSpinner.WHEEL_STOP, detectWheelRotation);
		}

		public function getWheelContiner() : Sprite {
			return _wheelContainer;
		}

		private function detectWheelRotation(event : Event) : void {
			var wheelRotation : int = Math.round(_wheelContainer.rotation);
			getDataProvider().setValueByKey('wheelRotation', wheelRotation);
			dispatchEvent(new Event(GameView.DETECT_CURRENT_SCORE));
		}
	}
}
