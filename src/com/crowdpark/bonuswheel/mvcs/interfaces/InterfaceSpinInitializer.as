package com.crowdpark.bonuswheel.mvcs.interfaces
{
	import flash.display.Sprite;

	/**
	 * @author fatmatekin
	 */
	public interface InterfaceSpinInitializer
	{
		function calculateVelocity() : Number;

		function rotateWithInitializer(dragObject : Sprite, spinObject : Sprite) : void

		function getRotationWay() : String;

		function setRotationWay() : void;

		function getDragObject() : Sprite;

		function setDragObject(object : Sprite) : InterfaceSpinInitializer;
		
		function checkSpeed():Number;
	}
}
