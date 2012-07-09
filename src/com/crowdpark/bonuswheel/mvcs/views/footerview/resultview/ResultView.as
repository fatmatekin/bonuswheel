package com.crowdpark.bonuswheel.mvcs.views.footerview.resultview
{
	import com.crowdpark.bonuswheel.mvcs.assets.SingleResult;
	import com.crowdpark.bonuswheel.mvcs.core.BaseView;

	import flash.events.Event;

	/**
	 * @author fatmatekin
	 */
	public class ResultView extends BaseView
	{
		private var _dailyBonusField : SingleResult;
		private var _friendsField : SingleResult;
		private var _likeField : SingleResult;
		private var _totalWin : SingleResult;

		override public function onAddedToStageListener(event : Event) : void
		{
			_friendsField.x = _dailyBonusField.x + _dailyBonusField.width + 40;
			_likeField.x = _friendsField.x + _friendsField.width + 40;
			_totalWin.x = _likeField.x + _likeField.width + 40;
		}

		public function setDailyBonusField(dailyBonus : uint) : void
		{
			_dailyBonusField = new SingleResult();
			_dailyBonusField.setCoinAmountFieldText(String(dailyBonus));
			_dailyBonusField.setTypeFieldText('DAILY BONUS');

			addChild(_dailyBonusField);
		}

		public function setFriendsField(friends : uint) : void
		{
			_friendsField = new SingleResult();
			_friendsField.setCoinAmountFieldText(String(friends));
			_friendsField.setTypeFieldText('FRIENDS');

			addChild(_friendsField);
		}

		public function setLikeField(like : uint) : void
		{
			_likeField = new SingleResult();
			_likeField.setCoinAmountFieldText(String(like));
			_likeField.setTypeFieldText('LIKE');

			addChild(_likeField);
		}

		public function setTotalWin(total : uint) : void
		{
			_totalWin = new SingleResult();
			_totalWin.setCoinAmountFieldText(String(total));
			_totalWin.setTypeFieldText('TOTAL WIN');

			addChild(_totalWin);
		}
	}
}
