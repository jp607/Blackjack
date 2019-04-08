package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;

	public class Karte extends MovieClip
	{

		private var vorderseite:Loader;
		private var rueckseite:Loader;
		private var url:URLRequest;
		private var wert:int;
		private var nummer:int;
		private var abl:MovieClip;

		public function Karte(imagename:String,ablage:MovieClip,e:int)
		{
			abl = ablage;
			url = new URLRequest(imagename);
			vorderseite = new Loader();
			rueckseite = new Loader();
			vorderseite.load(url);
			nummer = e;
			rueckseite.load(new URLRequest("deck/100.gif"));
			addChild(rueckseite);
			addEventListener(MouseEvent.MOUSE_DOWN, drag);
			addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		public function setCardValue()
		{
			if (nummer == 101 || nummer == 114 ||  nummer == 127 ||  nummer == 140)
			{
				wert = 1;
			}
			if (nummer == 102 || nummer == 115 ||  nummer == 128 ||  nummer == 141)
			{
				wert = 2;
			}
			if (nummer == 103 || nummer == 116 ||  nummer == 129 ||  nummer == 142)
			{
				wert = 3;
			}
			if (nummer == 104 || nummer == 117 ||  nummer == 130 ||  nummer == 143)
			{
				wert = 4;
			}
			if (nummer == 105 || nummer == 118 ||  nummer == 131 ||  nummer == 144)
			{
				wert = 5;
			}
			if (nummer == 106 || nummer == 119 ||  nummer == 132 ||  nummer == 145)
			{
				wert = 6;
			}
			if (nummer == 107 || nummer == 120 ||  nummer == 133 ||  nummer == 146)
			{
				wert = 7;
			}
			if (nummer == 108 || nummer == 121 ||  nummer == 134 ||  nummer == 147)
			{
				wert = 8;
			}
			if (nummer == 109 || nummer == 122 ||  nummer == 135 ||  nummer == 148)
			{
				wert = 9;
			}
			if (nummer == 110 || nummer == 123 ||  nummer == 136 ||  nummer == 149 || nummer == 111 || nummer == 124 ||  nummer == 137 ||  nummer == 150 || nummer == 112 || nummer == 125 ||  nummer == 138 ||  nummer == 151 || nummer == 113 || nummer == 126 ||  nummer == 139 ||  nummer == 152)
			{
				wert = 10;
			}

		}
		public function getCardValue()
		{
			return wert;
		}
		public function setCardImage()
		{
			removeChild(rueckseite);
			addChild(vorderseite);
		}
		private function drag(n:MouseEvent):void
		{
			startDrag();

			this.parent.setChildIndex(this,this.parent.numChildren-1);
		}
		private function drop(n:MouseEvent):void
		{
			stopDrag();
			if (this.hitTestObject(abl))
			{
				getCardValue();
				removeChild(rueckseite);
				addChild(vorderseite);

			}
			else
			{
				removeChild(rueckseite);

			}
		}




	}

}