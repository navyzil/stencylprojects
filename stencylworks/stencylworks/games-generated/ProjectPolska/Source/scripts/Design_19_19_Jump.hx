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



class Design_19_19_Jump extends ActorScript
{          	
	
public var _JumpKey:String;

public var _JumpSound:Sound;

public var _JumpSpeedUp:Float;

public var _JumpSpeedDown:Float;

public var _GravityCheck:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Jump Key", "_JumpKey");
nameMap.set("Jump Sound", "_JumpSound");
nameMap.set("Jump_Speed_Up", "_JumpSpeedUp");
_JumpSpeedUp = 0.0;
nameMap.set("Jump_Speed_Down", "_JumpSpeedDown");
_JumpSpeedDown = 0.0;
nameMap.set("Gravity_Check", "_GravityCheck");
_GravityCheck = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        actor.setActorValue("On Ground?", true);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        trace("" + actor.getCurrentFrame());
        /* "Call Jump" */
        if((isKeyPressed(_JumpKey) && (actor.getActorValue("On Ground?") == true)))
{
            playSound(_JumpSound);
            actor.setYVelocity(_JumpSpeedUp);
            /* "Time before recalling client to go down" */
            runLater(1000 * 0.25, function(timeTask:TimedTask):Void {
                        actor.setYVelocity(_JumpSpeedDown);
}, actor);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}