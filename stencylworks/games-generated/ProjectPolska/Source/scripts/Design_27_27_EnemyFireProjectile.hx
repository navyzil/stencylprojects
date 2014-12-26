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



class Design_27_27_EnemyFireProjectile extends ActorScript
{          	
	
public var _Delay:Float;

public var _Firing:Bool;

public var _Player:Actor;

public var _FiringSpeed:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Delay", "_Delay");
_Delay = 0.0;
nameMap.set("Firing", "_Firing");
_Firing = false;
nameMap.set("Player", "_Player");
nameMap.set("Firing Speed", "_FiringSpeed");
_FiringSpeed = 30.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        /* "This prevents the enemy from shooting as soon as it comes on screen, since that's annoying and would cause cheap deaths." */
        _Firing = true;
propertyChanged("_Firing", _Firing);
        runLater(1000 * _Delay, function(timeTask:TimedTask):Void {
                    _Firing = false;
propertyChanged("_Firing", _Firing);
}, actor);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(!(_Firing))
{
            _Firing = true;
propertyChanged("_Firing", _Firing);
            createRecycledActor(getActorType(484), (actor.getXCenter() - 20), (actor.getYCenter() - 28), Script.BACK);
            /* "This long math block determines the angle between the firing enemy and the player. The +20 and +12 are so that it shoots more toward the center of the player actor." */
            getLastCreatedActor().setVelocity(Utils.DEG * (Math.atan2((( + 20) - actor.getY()), (( + 12) - actor.getX()))), _FiringSpeed);
            runLater(1000 * _Delay, function(timeTask:TimedTask):Void {
                        _Firing = false;
propertyChanged("_Firing", _Firing);
}, actor);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}