package com.crowdpark.bonuswheel.mvcs.commands
{
	import com.crowdpark.bonuswheel.mvcs.views.footerview.FooterView;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.GameView;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author fatmatekin
	 */
	public class StartupCompleteCommand extends Command
	{
		override public function execute() : void
		{
			var gameView : GameView = new GameView();
			gameView.init();
			contextView.addChild(gameView);

			var footerView : FooterView = new FooterView();
			contextView.addChild(footerView);
		}
	}
}
