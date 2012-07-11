package com.crowdpark.bonuswheel.mvcs.assets {
	import utils.draw.createRectangleShape;
	import utils.textField.createField;

	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public class DragObject extends Sprite
	{
		public function DragObject()
		{
			addChild(createRectangleShape(100, 35, 0xff0000, 1, -50, 0));
			addChild(createField('LEFT', -50, 5, 200, 20, false, 'Verdana', 15, 0x000000));
			addChild(createField('RIGHT', 0, 5, 200, 20, false, 'Verdana', 15, 0x000000));
			
			buttonMode = true;
			mouseChildren = false;
			this.x = 50;
			this.y = 0;
		}
	}
}
