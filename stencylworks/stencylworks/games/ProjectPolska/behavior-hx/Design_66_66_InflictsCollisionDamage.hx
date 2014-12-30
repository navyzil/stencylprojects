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



class Design_66_66_InflictsCollisionDamage extends ActorScript
{          	
	
public var _TopDamageAmount:Float;

public var _BottomDamageAmount:Float;

public var _RightDamageAmount:Float;

public var _LeftDamageAmount:Float;

public var _DamageActorGroups:Array<Dynamic>;
    
/* ========================= Custom Block ========================= */


/* Params are: __Amount __Target */
public function _customBlock_ApplyDamage(__Amount:Float, __Target:Actor):Void
{
var __Self:Actor = actor;
        if((__Amount == 0))
{
            return;
}

        if((!(__Target.isAlive()) || (cast((__Target.say("Health Manager", "_customBlock_GetCurrentHealth")), Float) <= 0)))
{
            return;
}

        if((_DamageActorGroups.length == 0))
{
            __Target.say("Health Manager", "_customBlock_Damage", [__Amount]);
            return;
}

        /* "Make sure our target is in an Actor Group we want to damage." */
        if(Utils.contains(_DamageActorGroups, __Target.getGroup()))
{
            __Target.say("Health Manager", "_customBlock_Damage", [__Amount]);
}

}

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Top Damage Amount", "_TopDamageAmount");
_TopDamageAmount = 0.0;
nameMap.set("Bottom Damage Amount", "_BottomDamageAmount");
_BottomDamageAmount = 1.0;
nameMap.set("Right Damage Amount", "_RightDamageAmount");
_RightDamageAmount = 1.0;
nameMap.set("Left Damage Amount", "_LeftDamageAmount");
_LeftDamageAmount = 1.0;
nameMap.set("Damage Actor Groups", "_DamageActorGroups");
_DamageActorGroups = [];
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== Something Else ======================== */
addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(event.thisFromTop)
{
            actor.say("Inflicts Collision Damage", "_customBlock_ApplyDamage", [_TopDamageAmount,actor.getLastCollidedActor()]);
}

        if(event.thisFromBottom)
{
            actor.say("Inflicts Collision Damage", "_customBlock_ApplyDamage", [_BottomDamageAmount,actor.getLastCollidedActor()]);
}

        if(event.thisFromRight)
{
            actor.say("Inflicts Collision Damage", "_customBlock_ApplyDamage", [_RightDamageAmount,actor.getLastCollidedActor()]);
}

        if(event.thisFromLeft)
{
            actor.say("Inflicts Collision Damage", "_customBlock_ApplyDamage", [_LeftDamageAmount,actor.getLastCollidedActor()]);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}