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



class Design_60_60_FireBulletV2 extends ActorScript
{          	
	
public var _LeftXOffset:Float;

public var _LeftYOffset:Float;

public var _ForceoftheProjectile:Float;

public var _IdleLeft:String;

public var _WalkRunLeft:String;

public var _JumpLeft:String;

public var _RightXOffset:Float;

public var _RightYOffset:Float;

public var _IdleRight:String;

public var _WalkRunRight:String;

public var _JumpRight:String;

public var _FireButton:String;

public var _Projectile:ActorType;

public var _FacingLeft:Bool;

public var _attackIdleLeft:String;

public var _attackRunWalkLeft:String;

public var _attackIdleRight:String;

public var _attackJumpLeft:String;

public var _attackRunWalkRight:String;

public var _attackJumpRight:String;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Left X Offset", "_LeftXOffset");
_LeftXOffset = 0.0;
nameMap.set("Left Y Offset", "_LeftYOffset");
_LeftYOffset = 0.0;
nameMap.set("Force of the Projectile", "_ForceoftheProjectile");
_ForceoftheProjectile = 0.0;
nameMap.set("Idle Left", "_IdleLeft");
nameMap.set("Walk / Run Left", "_WalkRunLeft");
nameMap.set("Jump Left", "_JumpLeft");
nameMap.set("Right X Offset", "_RightXOffset");
_RightXOffset = 0.0;
nameMap.set("Right Y Offset", "_RightYOffset");
_RightYOffset = 0.0;
nameMap.set("Idle Right", "_IdleRight");
nameMap.set("Walk / Run Right", "_WalkRunRight");
nameMap.set("Jump Right", "_JumpRight");
nameMap.set("Fire Button", "_FireButton");
nameMap.set("Projectile", "_Projectile");
nameMap.set("FacingLeft", "_FacingLeft");
_FacingLeft = false;
nameMap.set("Actor", "actor");
nameMap.set("attackIdleLeft", "_attackIdleLeft");
nameMap.set("attackRunWalkLeft", "_attackRunWalkLeft");
nameMap.set("attackIdleRight", "_attackIdleRight");
nameMap.set("attackJumpLeft", "_attackJumpLeft");
nameMap.set("attackRunWalkRight", "_attackRunWalkRight");
nameMap.set("attackJumpRight", "_attackJumpRight");

	}
	
	override public function init()
	{
		    
/* =========================== Keyboard =========================== */
addKeyStateListener(_FireButton, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        trace("" + "FIRE");
        if(((actor.getAnimation() == _IdleLeft) || ((actor.getAnimation() == _WalkRunLeft) || (actor.getAnimation() == _JumpLeft))))
{
            trace("" + "create projectile ");
            createRecycledActor(_Projectile, (actor.getX() + _LeftXOffset), (actor.getY() + _LeftYOffset), Script.FRONT);
            trace("" + "go left");
            getLastCreatedActor().applyImpulse(-10, 0, _ForceoftheProjectile);
}

        else if(((actor.getAnimation() == _IdleRight) || ((actor.getAnimation() == _WalkRunRight) || (actor.getAnimation() == _JumpRight))))
{
            trace("" + "create projectile ");
            createRecycledActor(_Projectile, (actor.getX() + _RightXOffset), (actor.getY() + _RightYOffset), Script.FRONT);
            trace("" + "go right");
            getLastCreatedActor().applyImpulse(10, 0, _ForceoftheProjectile);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("enter", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        if(_FacingLeft)
{
            trace("" + "firing left");
            if((actor.getAnimation() == _IdleLeft))
{
                actor.setAnimation("" + _attackIdleLeft);
}

            if((actor.getAnimation() == _WalkRunLeft))
{
                actor.setAnimation("" + _attackRunWalkLeft);
}

            if((actor.getAnimation() == _JumpLeft))
{
                actor.setAnimation("" + _attackJumpLeft);
}

}

        else
{
            if((actor.getAnimation() == _IdleRight))
{
                actor.setAnimation("" + _attackIdleRight);
}

            if((actor.getAnimation() == _WalkRunRight))
{
                actor.setAnimation("" + _attackRunWalkRight);
}

            if((actor.getAnimation() == _JumpRight))
{
                actor.setAnimation("" + _attackJumpRight);
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}