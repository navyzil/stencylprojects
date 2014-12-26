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



class Design_26_26_enemyHop extends ActorScript
{          	
	
public var _hopLeftAnimation:String;

public var _hopRightAnimation:String;

public var _jumpSpeed:Float;

public var _gravityCheck:Float;

public var _walkSpeed:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("hopLeftAnimation", "_hopLeftAnimation");
nameMap.set("hopRightAnimation", "_hopRightAnimation");
nameMap.set("jumpSpeed", "_jumpSpeed");
_jumpSpeed = 0;
nameMap.set("gravityCheck", "_gravityCheck");
_gravityCheck = 0;
nameMap.set("walkSpeed", "_walkSpeed");
_walkSpeed = 0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        actor.setAnimation("" + ("" + _hopLeftAnimation));
        actor.setActorValue("On Ground?", true);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((actor.getAnimation() == _hopLeftAnimation))
{
            actor.setXVelocity(-(_walkSpeed));
}

        if((actor.getAnimation() == _hopRightAnimation))
{
            actor.setXVelocity(_walkSpeed);
}

        runPeriodically(1000 * 0.25, function(timeTask:TimedTask):Void {
                    if((actor.getActorValue("On Ground?") == true))
{
                        actor.setYVelocity(-(_jumpSpeed));
                        actor.setActorValue("On Ground?", false);
}

}, actor);
        runLater(1000 * 0.25, function(timeTask:TimedTask):Void {
                    if((actor.getActorValue("On Ground?") == false))
{
                        actor.setYVelocity(_jumpSpeed);
                        actor.setActorValue("On Ground?", true);
}

}, actor);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}