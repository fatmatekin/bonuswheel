package com.crowdpark.bonuswheel.mvcs.events
{
	import com.crowdpark.bonuswheel.mvcs.core.BaseEvent;

	/**
	 * @author fatmatekin
	 */
	public class GameEvent extends BaseEvent
	{
		public static const START_GAME : String = "START_GAME";
		public static const SET_CURRENT_SCORE : String = "SET_CURRENT_SCORE";
		public static const SHOW_RESULT : String = "SHOW_RESULT";
		public static const SHARE_RESULT : String = "SHARE_RESULT";
		public static const CONTINUE : String = "CONTINUE";
		public static const DETECT_CURRENT_SCORE : String = "DETECT_CURRENT_SCORE";

		public function GameEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = true)
		{
			super(type, bubbles, cancelable);
		}
	}
}
