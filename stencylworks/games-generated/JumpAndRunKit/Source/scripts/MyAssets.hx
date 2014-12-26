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
	public static var stageWidth:Int = 480;
	public static var stageHeight:Int = 320;
	public static var initSceneID:Int = 8;
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
	public static var maxScale:Float = 1.0;
	public static var disableBackButton:Bool = false;
	
	//Keys
	public static var androidPublicKey:String = "";

	public function new()
	{
		Input.enable();
		Input.define("groundpound", [nme.ui.Keyboard.C]);
		Input.define("duck", [nme.ui.Keyboard.DOWN]);
		Input.define("left", [nme.ui.Keyboard.LEFT]);
		Input.define("run", [nme.ui.Keyboard.X]);
		Input.define("right", [nme.ui.Keyboard.RIGHT]);
		Input.define("up", [nme.ui.Keyboard.UP]);
		Input.define("jump", [nme.ui.Keyboard.Z]);
		Input.define("jetpack", [nme.ui.Keyboard.UP]);
		Input.define("grapple", [nme.ui.Keyboard.X]);
		
	}
	
	public function loadResources(resourceMap:Map<String,Dynamic>):Void
	{
		var i = 0;
		var increment = 50.0 / Math.max(1, 29);
		
		
		resourceMap.set("478-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-478-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("476-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-476-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("474-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-474-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("286.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/tileset-286.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("433-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-0.png", false));
		resourceMap.set("433-1.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-1.png", false));
		resourceMap.set("433-2.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-2.png", false));
		resourceMap.set("433-3.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-3.png", false));
		resourceMap.set("433-4.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-4.png", false));
		resourceMap.set("433-5.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-5.png", false));
		resourceMap.set("433-6.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-6.png", false));
		resourceMap.set("433-7.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-7.png", false));
		resourceMap.set("433-8.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-8.png", false));
		resourceMap.set("433-9.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-9.png", false));
		resourceMap.set("433-10.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-10.png", false));
		resourceMap.set("433-11.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-11.png", false));
		resourceMap.set("433-12.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-12.png", false));
		resourceMap.set("433-13.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-13.png", false));
		resourceMap.set("433-14.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-14.png", false));
		resourceMap.set("433-15.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-433-15.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
		resourceMap.set("480-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-480-0.png", false));
com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i));
i++;
	}
	
	public function loadScenes(scenesXML:Map<Int,String>):Void
	{
		var i = 0;
		var increment = 10.0 / Math.max(1, 1);
		
		scenesXML.set(8, "Level");

com.stencyl.Data.instance.updatePreloader(90 + Std.int(increment * i));
i++;
	}
}