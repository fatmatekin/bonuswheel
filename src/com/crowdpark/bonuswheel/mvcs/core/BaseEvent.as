package com.crowdpark.bonuswheel.mvcs.core
{
	import com.crowdpark.bonuswheel.mvcs.interfaces.InterfaceVO;

	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class BaseEvent extends Event
	{
		private var _dataProvider : InterfaceVO;

		public function BaseEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = true)
		{
			super(type, bubbles, cancelable);
		}

		public function getDataProvider() : InterfaceVO
		{
			if (!_dataProvider)
			{
				_dataProvider = new BaseVO();
			}
			return _dataProvider;
		}

		public function setDataProvider(dataProvider : InterfaceVO) : BaseEvent
		{
			_dataProvider = dataProvider;
			return this;
		}
	}
}
