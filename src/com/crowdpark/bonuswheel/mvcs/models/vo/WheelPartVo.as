package com.crowdpark.bonuswheel.mvcs.models.vo {
	import com.crowdpark.bonuswheel.mvcs.core.BaseVO;

	/**
	 * @author fatmatekin
	 */
	public class WheelPartVo extends BaseVO {
		public function getRotation() : int {
			return int(getValueByKey('rotation'));
		}

		public function setRotation(rotation : int) : BaseVO {
			setValueByKey('rotation', rotation);
			return this;
		}

		public function setCoins(coins : uint) : BaseVO {
			setValueByKey('coins', coins);
			return this;
		}

		public function getCoins() : uint {
			return uint(getValueByKey('coins'));
		}
	}
}
