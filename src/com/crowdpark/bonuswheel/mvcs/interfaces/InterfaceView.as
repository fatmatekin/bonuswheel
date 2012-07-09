package com.crowdpark.bonuswheel.mvcs.interfaces
{
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;

	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public interface InterfaceView
	{
		function onAddedToStageListener(event : Event) : void

		function getDataProvider() : InterfaceVO;

		function setDataProvider(dataProvider : InterfaceVO) : BaseView;
	}
}
