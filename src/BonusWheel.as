package
{
	import com.crowdpark.bonuswheel.mvcs.BonusWheelContext;

	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public class BonusWheel extends Sprite
	{
		public function BonusWheel()
		{
			var context : BonusWheelContext = new BonusWheelContext(this);
		}
	}
}
