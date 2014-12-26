package scripts;

import haxe.xml.Fast;
import nme.Assets;
import com.stencyl.AssetLoader;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.Engine;

class MyAssets implements AssetLoader
{
	//Game
	public static var landscape:Bool = true;
	public static var autorotate:Bool = false;
	public static var stretchToFit:Bool = false;
	public static var scaleToFit1:Bool = false;
	public static var scaleToFit2:Bool = false;
	public static var scaleToFit3:Bool = false;
	public static var stageWidth:Int = 640;
	public static var stageHeight:Int = 480;
	public static var initSceneID:Int = 1;
	public static var physicsMode:Int = 0;
	public static var gameScale:Float = 1.0;
	public static var gameImageBase:String = "1x";
	public static var antialias:Bool = true;
	public static var startInFullScreen = false;
	public static var scaleMode:Int = 0;

	//APIs
	public static var adPositionBottom:Bool = true;
	public static var whirlID:String = "";
	public static var mochiID:String = "";
	public static var cpmstarID:String = "";
	public static var newgroundsID:String = "";
	public static var newgroundsKey:String = "";
	
	//Other
	public static var releaseMode:Bool = false;
	public static var showConsole:Bool = false;
	public static var debugDraw:Bool = false;
	public static var always1x:Bool = false;
	public static var maxScale:Float = 3.0;
	public static var disableBackButton:Bool = false;
	
	//Keys
	public static var androidPublicKey:String = "";

	public function new()
	{
		Input.enable();
		Input.define("Up", [nme.ui.Keyboard.UP]);
		Input.define("Down", [nme.ui.Keyboard.DOWN]);
		Input.define("Left", [nme.ui.Keyboard.LEFT]);
		Input.define("Right", [nme.ui.Keyboard.RIGHT]);
		Input.define("Z", [nme.ui.Keyboard.Z]);
		Input.define("X", [nme.ui.Keyboard.X]);
		Input.define("Enter", [nme.ui.Keyboard.ENTER]);
		Input.define("R", [nme.ui.Keyboard.R]);
		
	}
	
	public function loadResources(resourceMap:Map<String,Dynamic>):Void
	{
		var i = 0;
		var increment = 50.0 / Math.max(1, 26);
		
		
		resourceMap.set("6.fnt", Assets.getText("assets/graphics/" + Engine.IMG_BASE + "/font-6.fnt"));
		resourceMap.set("6.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/font-6.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("8-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/background-8-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("12-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-12-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("20-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-20-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("29-2.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-2.png", false));
		resourceMap.set("29-3.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-3.png", false));
		resourceMap.set("29-4.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-4.png", false));
		resourceMap.set("29-5.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-5.png", false));
		resourceMap.set("29-6.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-6.png", false));
		resourceMap.set("29-7.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-7.png", false));
		resourceMap.set("29-8.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-8.png", false));
		resourceMap.set("29-9.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-9.png", false));
		resourceMap.set("29-10.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-10.png", false));
		resourceMap.set("29-11.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-11.png", false));
		resourceMap.set("29-12.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-12.png", false));
		resourceMap.set("29-13.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-29-13.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("31-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-31-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("35.fnt", Assets.getText("assets/graphics/" + Engine.IMG_BASE + "/font-35.fnt"));
		resourceMap.set("35.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/font-35.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
	}
	
	public function loadScenes(scenesXML:Map<Int,String>):Void
	{
		var i = 0;
		var increment = 10.0 / Math.max(1, 1);
		
		scenesXML.set(1, "Game Scene");

com.stencyl.Data.instance.updatePreloader(90 + Std.int(increment * i));
i++;
	}
}