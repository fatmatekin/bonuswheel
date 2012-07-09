package com.crowdpark.bonuswheel.mvcs.models
{
	import com.crowdpark.bonuswheel.mvcs.events.GameEvent;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author fatmatekin
	 */
	public class ScoreModel extends Actor
	{
		private var _dailybonus : uint = 0;
		private var _totalWin : uint;

		public function getDailybonus() : uint
		{
			return _dailybonus;
		}

		public function setDailybonus(dailybonus : uint) : ScoreModel
		{
			this._dailybonus = dailybonus;
			dispatch(new GameEvent(GameEvent.SHOW_RESULT));

			return this;
		}

		public function getTotalWin() : uint
		{
			return _totalWin;
		}

		public function setTotalWin(totalWin : uint) : ScoreModel
		{
			this._totalWin = totalWin;
			return this;
		}
	}
}
