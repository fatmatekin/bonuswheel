package com.crowdpark.bonuswheel.mvcs.commands
{
	import com.crowdpark.bonuswheel.mvcs.events.GameEvent;
	import com.crowdpark.bonuswheel.mvcs.models.WheelModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author fatmatekin
	 */
	public class DetectCurrentScoreCommand extends Command
	{
		[Inject]
		public var wheelModel : WheelModel;
		[Inject]
		public var gameEvent : GameEvent;

		override public function execute() : void
		{
			var wheelRotation : int = int(gameEvent.getDataProvider().getValueByKey('wheelRotation'));

			wheelModel.setWheelRotation(wheelRotation % 360);
			wheelModel.detectCurrentWheelPart();
		}
	}
}
