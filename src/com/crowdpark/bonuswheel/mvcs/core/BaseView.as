package com.crowdpark.bonuswheel.mvcs.core
{
	import com.crowdpark.bonuswheel.mvcs.interfaces.InterfaceVO;
	import com.crowdpark.bonuswheel.mvcs.interfaces.InterfaceView;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class BaseView extends Sprite implements InterfaceView
	{
		private var _dataProvider : InterfaceVO;

		public function BaseView()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStageListener);
		}

		public function onAddedToStageListener(event : Event) : void
		{
		}

		public function setDataProvider(dataProvider : InterfaceVO) : BaseView
		{
			_dataProvider = dataProvider;
			return this;
		}

		public function getDataProvider() : InterfaceVO
		{
			if (!_dataProvider)
			{
				_dataProvider = new BaseVO();
			}
			return _dataProvider;
		}
	}
}
