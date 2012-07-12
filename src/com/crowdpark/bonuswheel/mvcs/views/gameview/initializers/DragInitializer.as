package com.crowdpark.bonuswheel.mvcs.views.gameview.initializers
{
	import flash.geom.Rectangle;
	import com.crowdpark.bonuswheel.mvcs.views.gameview.initializers.base.BaseInitializer;

	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public class DragInitializer extends BaseInitializer
	{
		override public function rotateWithInitializer(dragObject : Sprite, spinObject : Sprite) : void
		{
			super.rotateWithInitializer(dragObject, spinObject);

			spinObject.rotation = dragObject.x - spinObject.x;
		}

		public function startDragObject() : void
		{
			 getDragObject().startDrag(false, new Rectangle(getDragObject().x - getDragObject().width, getDragObject().y, 200, 0));
		}
	}
}
