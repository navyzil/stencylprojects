package scripts;

import com.stencyl.graphics.G;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.display.BitmapData;
import nme.display.Bitmap;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.events.TouchEvent;
import nme.net.URLLoader;

import box2D.dynamics.joints.B2Joint;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_26_26_EnemyDetection extends ActorScript
{          	
	
public var _Enemy:Actor;

public var _Player:Actor;

public var _HeightDetection:Float;

public var _WidthDetection:Float;

public var _Up:String;

public var _Down:String;

public var _Left:String;

public var _Right:String;

public var _DetectAnimationforUp:String;

public var _DetectAnimationforDown:String;

public var _DetectAnimationforLeft:String;

public var _DetectAnimationforRight:String;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Enemy", "_Enemy");
nameMap.set("Player", "_Player");
nameMap.set("Height Detection", "_HeightDetection");
_HeightDetection = 0.0;
nameMap.set("Width Detection", "_WidthDetection");
_WidthDetection = 0.0;
nameMap.set("Up", "_Up");
nameMap.set("Down", "_Down");
nameMap.set("Left", "_Left");
nameMap.set("Right", "_Right");
nameMap.set("Detect Animation for Up", "_DetectAnimationforUp");
nameMap.set("Detect Animation for Down", "_DetectAnimationforDown");
nameMap.set("Detect Animation for Left", "_DetectAnimationforLeft");
nameMap.set("Detect Animation for Right", "_DetectAnimationforRight");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((((_Player.getXCenter() <= (_Enemy.getXCenter() - _WidthDetection)) || (_Player.getXCenter() >= (_Enemy.getXCenter() + _WidthDetection))) || ((_Player.getYCenter() <= (_Enemy.getYCenter() - _HeightDetection)) || (_Player.getYCenter() >= (_Enemy.getYCenter() + _HeightDetection)))))
{

}

        else
{
            if(isKeyReleased("up"))
{
                _Player.setAnimation("" + _DetectAnimationforUp);
}

            else if(isKeyReleased("down"))
{
                _Player.setAnimation("" + _DetectAnimationforDown);
}

            else if(isKeyReleased("left"))
{
                _Player.setAnimation("" + _DetectAnimationforLeft);
}

            else if(isKeyReleased("right"))
{
                _Player.setAnimation("" + _DetectAnimationforRight);
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}