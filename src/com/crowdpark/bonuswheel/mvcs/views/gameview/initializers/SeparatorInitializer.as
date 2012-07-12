package com.crowdpark.bonuswheel.mvcs.views.gameview.initializers
{
	import com.crowdpark.bonuswheel.mvcs.views.gameview.initializers.base.BaseInitializer;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.spinner.SeparatorCircle;

	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public class SeparatorInitializer extends BaseInitializer
	{
		override public function rotateWithInitializer(dragObject : Sprite, spinObject : Sprite) : void
		{
			super.rotateWithInitializer(dragObject, spinObject);

			var distanceY : Number = mouseY - spinObject.y;
			var distanceX : Number = mouseX - spinObject.x;
			var radians : Number = Math.atan2(distanceY, distanceX) - SeparatorCircle(dragObject).getRotation();
			var degrees : Number = (radians * (180 / Math.PI));

			spinObject.rotation = degrees;
		}
	}
}
