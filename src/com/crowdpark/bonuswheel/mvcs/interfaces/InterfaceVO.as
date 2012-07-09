package com.crowdpark.bonuswheel.mvcs.interfaces
{
	/**
	 * @author fatmatekin
	 */
	public interface InterfaceVO
	{
		function getValueByKey(key : String) : Object

		function setValueByKey(key : String, value : Object) : Object;

		function getValues() : Object;
	}
}
