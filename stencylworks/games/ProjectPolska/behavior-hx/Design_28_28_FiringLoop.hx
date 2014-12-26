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



class Design_28_28_FiringLoop extends ActorScript
{          	
	
public var _Counter:Float;

public var _RestingTime:Float;

public var _FiringTime:Float;

public var _FrameRate:Float;

public var _Bullet:ActorType;

public var _StartFiring:Bool;

public var _FiringRate:Float;

public var _YSpeed:Float;

public var _XSpeed:Float;

public var _OffsetX:Float;

public var _OffsetY:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Counter", "_Counter");
_Counter = 0.0;
nameMap.set("RestingTime", "_RestingTime");
_RestingTime = 2.0;
nameMap.set("FiringTime", "_FiringTime");
_FiringTime = 2.0;
nameMap.set("FrameRate", "_FrameRate");
_FrameRate = 60.0;
nameMap.set("Bullet", "_Bullet");
nameMap.set("StartFiring", "_StartFiring");
_StartFiring = true;
nameMap.set("FiringRate", "_FiringRate");
_FiringRate = 3.0;
nameMap.set("YSpeed", "_YSpeed");
_YSpeed = 0.0;
nameMap.set("XSpeed", "_XSpeed");
_XSpeed = 25.0;
nameMap.set("OffsetX", "_OffsetX");
_OffsetX = -16.0;
nameMap.set("OffsetY", "_OffsetY");
_OffsetY = -16.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _FiringRate = asNumber(Math.round((_FrameRate / _FiringRate)));
propertyChanged("_FiringRate", _FiringRate);
        _FiringTime = asNumber(Math.round((_FiringTime * _FrameRate)));
propertyChanged("_FiringTime", _FiringTime);
        _RestingTime = asNumber(Math.round(((_RestingTime * _FrameRate) + _FiringTime)));
propertyChanged("_RestingTime", _RestingTime);
        if(_StartFiring)
{
            _Counter = asNumber(0);
propertyChanged("_Counter", _Counter);
}

        else
{
            _Counter = asNumber(_FiringTime);
propertyChanged("_Counter", _Counter);
}

    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((_Counter < _FiringTime))
{
            if(((_Counter % _FiringRate) == 0))
{
                createRecycledActor(_Bullet, (actor.getXCenter() + _OffsetX), (actor.getYCenter() + _OffsetY), Script.FRONT);
                getLastCreatedActor().setXVelocity(_XSpeed);
                getLastCreatedActor().setYVelocity(_YSpeed);
}

}

        _Counter += 1;
propertyChanged("_Counter", _Counter);
        if((_Counter >= _RestingTime))
{
            _Counter = asNumber(0);
propertyChanged("_Counter", _Counter);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}