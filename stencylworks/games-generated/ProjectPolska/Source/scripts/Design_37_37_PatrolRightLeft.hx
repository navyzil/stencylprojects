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



class Design_37_37_PatrolRightLeft extends ActorScript
{          	
	
public var _Speed:Float;

public var _UpOrDown:Bool;

public var _endPoint:Float;

public var _StartPoint:Float;

public var _animationLeft:String;

public var _animationRight:String;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Speed", "_Speed");
_Speed = 0.0;
nameMap.set("UpOrDown", "_UpOrDown");
_UpOrDown = false;
nameMap.set("endPoint", "_endPoint");
_endPoint = 0.0;
nameMap.set("StartPoint", "_StartPoint");
_StartPoint = 0.0;
nameMap.set("animationLeft", "_animationLeft");
nameMap.set("animationRight", "_animationRight");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================= Every N seconds ======================== */
runPeriodically(1000 * 0.01, function(timeTask:TimedTask):Void {
if(wrapper.enabled){
        if((_UpOrDown == false))
{
            trace("" + (("" + "DEBUG") + ("" + (actor.getX() + _Speed))));
            actor.setX((actor.getX() + _Speed));
            actor.setAnimation("" + ("" + _animationRight));
}

        if((actor.getX() == _endPoint))
{
            _UpOrDown = false;
propertyChanged("_UpOrDown", _UpOrDown);
}

        else
{
            actor.setX((actor.getX() - _Speed));
            actor.setAnimation("" + ("" + _animationLeft));
}

        if((actor.getX() == _StartPoint))
{
            _UpOrDown = true;
propertyChanged("_UpOrDown", _UpOrDown);
}

}
}, actor);

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}