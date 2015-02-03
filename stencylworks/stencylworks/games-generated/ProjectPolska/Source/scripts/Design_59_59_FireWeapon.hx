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



class Design_59_59_FireWeapon extends ActorScript
{          	
	
public var _FacingLeft:Bool;

public var _attackLeftAnimation:String;

public var _attackRightAnimation:String;

public var _fireButton:String;

public var _FireDirection:Float;

public var _Wait:Bool;

public var _RateOfFire:Float;

public var _UpAnimations:String;

public var _DownAnimations:String;

public var _LeftAnimations:String;

public var _RightAnimations:String;

public var _DirectionMode:String;

public var _Direction:Float;

public var _UseAmmunition:Bool;

public var _Offset:Float;

public var _BulletSpeed:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Facing Left", "_FacingLeft");
_FacingLeft = false;
nameMap.set("attackLeftAnimation", "_attackLeftAnimation");
nameMap.set("attackRightAnimation", "_attackRightAnimation");
nameMap.set("fireButton", "_fireButton");
nameMap.set("Fire Direction", "_FireDirection");
_FireDirection = 0.0;
nameMap.set("Wait", "_Wait");
_Wait = false;
nameMap.set("Rate Of Fire", "_RateOfFire");
_RateOfFire = 3.0;
nameMap.set("Up Animations", "_UpAnimations");
_UpAnimations = "";
nameMap.set("Down Animations", "_DownAnimations");
_DownAnimations = "";
nameMap.set("Left Animations", "_LeftAnimations");
_LeftAnimations = "";
nameMap.set("Right Animations", "_RightAnimations");
_RightAnimations = "";
nameMap.set("Direction Mode", "_DirectionMode");
_DirectionMode = "";
nameMap.set("Direction", "_Direction");
_Direction = 0.0;
nameMap.set("Use Ammunition", "_UseAmmunition");
_UseAmmunition = false;
nameMap.set("Offset", "_Offset");
_Offset = 0.0;
nameMap.set("Actor", "actor");
nameMap.set("Bullet Speed", "_BulletSpeed");
_BulletSpeed = 50.0;

	}
	
	override public function init()
	{
		    
/* =========================== Keyboard =========================== */
addKeyStateListener(_fireButton, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        trace("" + "FIRE");
        createRecycledActor(!ERROR!, 0, 0, Script.FRONT);
        if(_FacingLeft)
{
            trace("" + "Go Left");
            actor.setAnimation("" + _attackLeftAnimation);
            _FireDirection = asNumber(180);
propertyChanged("_FireDirection", _FireDirection);
}

        else
{
            trace("" + "Go Right");
            actor.setAnimation("" + _attackRightAnimation);
            _FireDirection = asNumber(0);
propertyChanged("_FireDirection", _FireDirection);
}

        getLastCreatedActor().setX(((actor.getXCenter() - (getLastCreatedActor().getWidth()/2)) + (_Offset * Math.cos(Utils.RAD * (_FireDirection) * Utils.RAD))));
        getLastCreatedActor().setY(((actor.getYCenter() - (getLastCreatedActor().getHeight()/2)) + (_Offset * Math.sin(Utils.RAD * (_FireDirection) * Utils.RAD))));
        getLastCreatedActor().setVelocity(_FireDirection, _BulletSpeed);
}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("left", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        if((_FacingLeft == false))
{
            _FacingLeft = true;
propertyChanged("_FacingLeft", _FacingLeft);
}

}
});
    
/* =========================== Keyboard =========================== */
addKeyStateListener("right", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        if((_FacingLeft == true))
{
            _FacingLeft = false;
propertyChanged("_FacingLeft", _FacingLeft);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}