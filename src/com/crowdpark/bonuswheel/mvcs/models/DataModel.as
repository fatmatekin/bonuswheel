package com.crowdpark.bonuswheel.mvcs.models
{
	import utils.array.randomize;

	import org.robotlegs.mvcs.Actor;

	/**
	 * @author fatmatekin
	 */
	public class DataModel extends Actor
	{
		private var _wheelParts : Array = [150, 200, 250, 300, 350, 400, 550, 600, 650, 700, 750, 800, 900, 1000, 3000];
		private var _friendsBonus : uint = 10;
		private var _likeBonus : uint = 10;

		public function getWheelParts() : Array
		{
			return randomize(_wheelParts);
		}

		public function setWheelParts(wheelParts : Array) : void
		{
			_wheelParts = wheelParts;
		}

		public function getFriendsBonus() : uint
		{
			return _friendsBonus;
		}

		public function setFriendsBonus(friendsBonus : uint) : DataModel
		{
			this._friendsBonus = friendsBonus;
			return this;
		}

		public function getLikeBonus() : uint
		{
			return _likeBonus;
		}

		public function setLikeBonus(likeBonus : uint) : DataModel
		{
			this._likeBonus = likeBonus;
			return this;
		}
	}
}
