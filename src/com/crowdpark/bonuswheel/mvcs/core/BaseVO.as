package com.crowdpark.bonuswheel.mvcs.core
{
	import com.crowdpark.bonuswheel.mvcs.interfaces.InterfaceVO;

	/**
	 * @author fatmatekin
	 */
	public class BaseVO implements InterfaceVO
	{
		private var _rawData : Object = new Object();

		public function setValueByKey(key : String, value : Object) : Object
		{
			_rawData[key] = value;
			return _rawData[key];
		}

		public function getValueByKey(key : String) : Object
		{
			return _rawData[key];
		}

		public function getValues() : Object
		{
			return _rawData;
		}
	}
}
