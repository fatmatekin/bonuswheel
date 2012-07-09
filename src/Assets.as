package
{
	/**
	 * @author fatmatekin
	 */
	public class Assets
	{
		[Embed(source="/assets/fonts/Verdana.ttf", embedAsCFF="false", fontName="Verdana", mimeType="application/x-font")]
		public static var FONT_VERDANA : Class;
		[Embed(source="/assets/wheelpart.png")]
		public static var WHEEL_BACKGROUND : Class;
		[Embed(source="/assets/stopper.png")]
		public static var STOPPER : Class;
	}
}
