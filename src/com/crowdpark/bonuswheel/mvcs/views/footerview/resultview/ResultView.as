package com.crowdpark.bonuswheel.mvcs.views.footerview.resultview
{
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;

	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class ResultView extends BaseView
	{
		private var _singleResults : Vector.<SingleResult>;

		public function ResultView(dailyBonus : uint, friends : uint, like : uint)
		{
			_singleResults = new Vector.<SingleResult>();

			addScoreField(String(dailyBonus), 'DAILY BONUS');
			addScoreField(String(friends), 'FRIENDS');
			addScoreField(String(like), 'LIKE');
			addScoreField(String(dailyBonus + friends + like), 'TOTAL WIN');

			showFields();
		}

		override public function onAddedToStageListener(event : Event) : void
		{
		}

		private function showFields() : void
		{
			var xpos : uint = 0;
			for (var i : uint = 0;i < _singleResults.length;i++)
			{
				var result : SingleResult = _singleResults[i];
				result.x = xpos;
				xpos += result.width + 40;
				addChild(_singleResults[i]);
			}
		}

		private function addScoreField(bonus : String, title : String) : void
		{
			var field : SingleResult = new SingleResult();
			field.setCoinAmountFieldText(bonus);
			field.setTypeFieldText(title);

			_singleResults.push(field);
		}
	}
}
