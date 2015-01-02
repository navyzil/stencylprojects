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



class Design_65_65_FlickerOnDamage extends ActorScript
{          	
	
public var _Duration:Float;

public var _StopFlicker:Bool;

public var _Flickering:Bool;

public var _DamagedMessage:String;
    
/* ========================= Custom Block ========================= */


/* Params are:__Self */
public function _customBlock_Flicker():Void
{
var __Self:Actor = actor;
        if(_Flickering)
{
            return;
}

        _Flickering = true;
propertyChanged("_Flickering", _Flickering);
        actor.setFilter([createNegativeFilter()]);
        runLater(1000 * _Duration, function(timeTask:TimedTask):Void {
                    _StopFlicker = true;
propertyChanged("_StopFlicker", _StopFlicker);
}, actor);
}
    public function _customEvent_whenThisHears_DamagedMessage():Void
{
        actor.say("Flicker On Damage", "_customBlock_Flicker");
}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Duration", "_Duration");
_Duration = 0.3;
nameMap.set("Stop Flicker?", "_StopFlicker");
_StopFlicker = false;
nameMap.set("Flickering?", "_Flickering");
_Flickering = false;
nameMap.set("Damaged Message", "_DamagedMessage");
_DamagedMessage = "Damaged";
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((_Flickering && _StopFlicker))
{
            actor.clearFilters();
            _Flickering = false;
propertyChanged("_Flickering", _Flickering);
            _StopFlicker = false;
propertyChanged("_StopFlicker", _StopFlicker);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		if(msg == ("_customEvent_" + _DamagedMessage))
{
_customEvent_whenThisHears_DamagedMessage();
return;
}

	}
}