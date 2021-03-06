package frameworks.cavalier.ui.components
{
	import frameworks.cavalier.ui.components.skins.BadgeSectionTitleBarSkin;
	import frameworks.crescent.components.supportClasses.SectionTitleBar;
	
	import spark.components.Group;
	import spark.components.Label;
	
	
	public class BadgeSectionTitleBar extends SectionTitleBar
	{
		/**
		 * @public
		 */
		[SkinPart]
		public var numericDisplay:Label;
		
		/**
		 * @public
		 */
		[SkinPart]
		public var badgetGroup:Group;
		
		/**
		 * @private
		 */
		private var _numItems:Number;

		/**
		 * @public
		 */
		[Bindable]
		public function get numItems():Number
		{
			return _numItems;
		}

		/**
		 * @private
		 */
		public function set numItems(value:Number):void
		{
			_numItems = value;
			if(numericDisplay)
				numericDisplay.text = value.toString();
			
			if(_numItems == 0 || isNaN(_numItems))
				badgetGroup.visible = false;
			else
				badgetGroup.visible = true;
		}
		
		/**
		 * Constructor
		 */
		public function BadgeSectionTitleBar()
		{
			super();
			setStyle("skinClass", frameworks.cavalier.ui.components.skins.BadgeSectionTitleBarSkin);
		}
		
		/**
		 * @private
		 */
		override protected function partAdded(partName:String, instance:Object):void{
			super.partAdded(partName, instance);
			
			if(partName == "numericDisplay")
				numericDisplay.text = _numItems.toString();
			else if(partName == "badgetGroup"){
				if(_numItems == 0 || isNaN(_numItems))
					badgetGroup.visible = false;
			}
		}
		
		/**
		 * @private
		 */
		override protected function measure():void{
			super.measure();
			measuredHeight = 75;
		}
		
	}
}