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



class Design_24_24_RandomWalkingAI extends ActorScript
{          	
	
public var _WalkR:String;

public var _WalkL:String;

public var _IdleR:String;

public var _IdleL:String;

public var _WalkSpeedR:Float;

public var _WalkSpeedLeft:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Walk R", "_WalkR");
nameMap.set("Walk L", "_WalkL");
nameMap.set("Idle R", "_IdleR");
nameMap.set("Idle L", "_IdleL");
nameMap.set("Walk Speed Right", "_WalkSpeedR");
_WalkSpeedR = 0.0;
nameMap.set("Walk Speed Left", "_WalkSpeedLeft");
_WalkSpeedLeft = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        if((.5 <= randomFloat()))
{
            actor.setAnimation("" + _WalkR);
            actor.setXVelocity(_WalkSpeedR);
}

        else
{
            actor.setAnimation("" + _WalkL);
            actor.setXVelocity(_WalkSpeedLeft);
}

        runLater(1000 * 4, function(timeTask:TimedTask):Void {
                    if(!(actor.isAlive()))
{
                        timeTask.repeats = false;
return;
}

                    runPeriodically(1000 * randomInt(Math.floor(2), Math.floor(6)), function(timeTask:TimedTask):Void {
                                actor.setXVelocity(0);
                                if(asBoolean("Facing Right?"))
{
                                    actor.setAnimation("" + _IdleR);
}

                                else
{
                                    actor.setAnimation("" + _IdleL);
}

                                runLater(1000 * (2 + randomInt(Math.floor(1), Math.floor(3))), function(timeTask:TimedTask):Void {
                                            if(!(actor.isAlive()))
{
                                                timeTask.repeats = false;
return;
}

                                            if((.5 <= randomFloat()))
{
                                                actor.setAnimation("" + _WalkR);
                                                actor.setXVelocity(_WalkSpeedR);
}

                                            else
{
                                                actor.setAnimation("" + _WalkL);
                                                actor.setXVelocity(_WalkSpeedLeft);
}

}, actor);
}, actor);
}, actor);
    
/* ======================== Something Else ======================== */
addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(event.thisFromLeft)
{
            actor.setAnimation("" + _WalkR);
            actor.setXVelocity(_WalkSpeedR);
}

        else if(event.thisFromRight)
{
            actor.setAnimation("" + _WalkL);
            actor.setXVelocity(_WalkSpeedLeft);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}