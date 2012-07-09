package com.crowdpark.bonuswheel.mvcs.commands
{
	import com.crowdpark.bonuswheel.mvcs.models.DataModel;
	import com.crowdpark.bonuswheel.mvcs.events.GameEvent;
	import com.crowdpark.bonuswheel.mvcs.models.ScoreModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author fatmatekin
	 */
	public class SetCurrentScoreCommand extends Command
	{
		[Inject]
		public var scoreModel : ScoreModel;
		[Inject]
		public var gameEvent : GameEvent;
		[Inject]
		public var dataModel : DataModel;

		override public function execute() : void
		{
			var dailyBonus : uint = uint(gameEvent.getDataProvider().getValueByKey('currentScore'));

			scoreModel.setDailybonus(dailyBonus);
		}
	}
}
