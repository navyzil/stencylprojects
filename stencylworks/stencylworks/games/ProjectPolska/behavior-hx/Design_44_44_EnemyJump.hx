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



class Design_44_44_EnemyJump extends ActorScript
{          	
	
public var _jumpRight:String;

public var _jumpLeft:String;

public var _isJumping:Bool;

public var _speed:Float;

public var _animationRight:String;

public var _animationLeft:String;

public var _seconds:Float;

public var _JumpingForce:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("jumpRight", "_jumpRight");
nameMap.set("jumpLeft", "_jumpLeft");
nameMap.set("isOnGround", "_isJumping");
_isJumping = true;
nameMap.set("speed", "_speed");
_speed = 0.0;
nameMap.set("animationRight", "_animationRight");
nameMap.set("animationLeft", "_animationLeft");
nameMap.set("seconds", "_seconds");
_seconds = 0.0;
nameMap.set("Jumping Force", "_JumpingForce");
_JumpingForce = 25.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _isJumping = true;
propertyChanged("_isJumping", _isJumping);
    
/* ======================= Every N seconds ======================== */
runPeriodically(1000 * _seconds, function(timeTask:TimedTask):Void {
if(wrapper.enabled){
        if(_isJumping)
{
            if((actor.getAnimation() == _animationLeft))
{
                actor.setAnimation("" + _jumpLeft);
}

            if((actor.getAnimation() == _animationRight))
{
                actor.setAnimation("" + _jumpRight);
}

            actor.applyImpulse(0, -1, _JumpingForce);
            _isJumping = false;
propertyChanged("_isJumping", _isJumping);
}

}
}, actor);
    
/* ======================== Something Else ======================== */
addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((event.thisFromLeft && !(event.thisCollidedWithSensor)))
{
            actor.setAnimation("" + _animationRight);
}

        if((event.thisFromRight && !(event.thisCollidedWithSensor)))
{
            actor.setAnimation("" + _animationLeft);
}

        if((event.thisFromBottom && !(event.thisCollidedWithSensor)))
{
            _isJumping = true;
propertyChanged("_isJumping", _isJumping);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}