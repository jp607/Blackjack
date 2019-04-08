package 
{

	import flash.display.*;
	import flash.text.*;
	import flash.events.*;


	public class SiebzehnUndVier extends flash.display.MovieClip
	{
		private var summeS:int,summeC:int;
		private var KarteS:int,KarteC:int;
		private var mc:MovieClip;
		private var cards:Array;
		private var K:Karte;


		public function SiebzehnUndVier()
		{
			startbtn.addEventListener( MouseEvent.CLICK , anfang);
			ende.addEventListener( MouseEvent.CLICK , endef);
			karte.addEventListener( MouseEvent.CLICK , kartef);
		}
		private function anfang(evt:Event)
		{
			init();
			karteziehen();
			karteziehen();
			comziehen();
			startbtn.removeEventListener( MouseEvent.CLICK , anfang);
		}
		private function init()
		{
			cards = new Array();

			var k1:String = ".gif";
			for (var e:int = 101; e < 153; e++)
			{
				var s:String = "deck/" + e + ".gif";
				cards.push(K =  new Karte(s,ablage,e));
				
				kartenwertSpieler_txt.text =  K.getCardValue() +"";  


				addChild(cards[e-101]);


			}


			summeS = 0;
			karteS = 0;
			summeC = 0;
			karteC = 0;
			gesamtwertComp_txt.text = summeC + "";
			kartenwertComp_txt.text = karteC + "";
			kartenwertSpieler_txt.text = karteS + "";
			gesamtwertSpieler_txt.text = summeS + "";



		}
		private function kartef(evt:Event)
		{
			karteziehen();
		}
		private function karteziehen()
		{
			//karteS = 1 + Math.floor(Math.random() * 10);
			K.getCardValue()
			trace("hallo"+K);
			summeS = summeS + karteS;
			//kartenwertSpieler_txt.text = K.getCardValue() + "";
			kartenwertSpieler_txt.text = karteS + "";
			gesamtwertSpieler_txt.text = summeS + "";
			if (summeS > 21)
			{
				karte.removeEventListener(MouseEvent.CLICK, kartef);
				vergleich();
			}
		}
		private function comziehen()
		{
			karteC = 1 + Math.floor(Math.random() * 10);
			summeC = summeC + karteC;
			gesamtwertComp_txt.text = summeC + "";
			kartenwertComp_txt.text = karteC + "";
		}
		private function endef(evt:Event)
		{
			ki();
			karte.removeEventListener(MouseEvent.CLICK, kartef);
			vergleich();
		}
		private function vergleich()
		{

			if (summeS > summeC || summeC > 21)
			{
				if (summeS < 22 || summeC > 21)
				{
					anzeige_txt.text = "Du hast gewonnen";
				}
				else
				{
					anzeige_txt.text = "Com hat gewonnen";
				}
			}
			else
			{
				anzeige_txt.text = "Com hat gewonnen";
			}
		}


		public function ki():void
		{



			while (summeS > summeC)
			{


				if (summeC <= 18 && summeS <= 21)
				{


					comziehen();

				}
				else
				{

					break;

				}

			}

		}




	}
}