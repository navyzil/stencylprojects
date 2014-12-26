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



class Design_9_9_SmoothCamera extends ActorScript
{          	
	
public var _auxX:Float;

public var _auxY:Float;

public var _Delay:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("auxX", "_auxX");
_auxX = 0.0;
nameMap.set("auxY", "_auxY");
_auxY = 0.0;
nameMap.set("Delay", "_Delay");
_Delay = 15.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _auxX = asNumber(actor.getXCenter());
propertyChanged("_auxX", _auxX);
        _auxY = asNumber(actor.getYCenter());
propertyChanged("_auxY", _auxY);
        _Delay = asNumber((_Delay + 1));
propertyChanged("_Delay", _Delay);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        _auxX = asNumber((_auxX + ((actor.getXCenter() - _auxX) / _Delay)));
propertyChanged("_auxX", _auxX);
        _auxY = asNumber((_auxY + ((actor.getYCenter() - _auxY) / _Delay)));
propertyChanged("_auxY", _auxY);
        getCamera().setLocation(_auxX, _auxY);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}