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



class Design_51_51_ExplodeOnDeath extends ActorScript
{          	
	
public var _MaximumSpeed:Float;

public var _NumberofFragments:Float;

public var _FragmentActorType:ActorType;

public var _MinimumSpeed:Float;

public var _MaximumTurningSpeed:Float;

public var _Offset:Float;

public var _ExplosionActorType:ActorType;

public var _Direction:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Maximum Speed", "_MaximumSpeed");
_MaximumSpeed = 10.0;
nameMap.set("Number of Fragments", "_NumberofFragments");
_NumberofFragments = 5.0;
nameMap.set("Fragment Actor Type", "_FragmentActorType");
nameMap.set("Minimum Speed", "_MinimumSpeed");
_MinimumSpeed = 5.0;
nameMap.set("Maximum Turning Speed", "_MaximumTurningSpeed");
_MaximumTurningSpeed = 360.0;
nameMap.set("Offset", "_Offset");
_Offset = 0.0;
nameMap.set("Explosion Actor Type", "_ExplosionActorType");
nameMap.set("Direction", "_Direction");
_Direction = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== Specific Actor ======================== */
addWhenKilledListener(actor, function(list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((hasValue(_FragmentActorType) != false))
{
            for(index0 in 0...Std.int(_NumberofFragments))
{
                createRecycledActor(_FragmentActorType, 0, 0, Script.FRONT);
                _Direction = asNumber(randomInt(Math.floor(0), Math.floor(360)));
propertyChanged("_Direction", _Direction);
                getLastCreatedActor().setX(((actor.getXCenter() - (getLastCreatedActor().getWidth()/2)) + (_Offset * Math.cos(Utils.RAD * (_Direction) * Utils.RAD))));
                getLastCreatedActor().setY(((actor.getYCenter() - (getLastCreatedActor().getHeight()/2)) + (_Offset * Math.sin(Utils.RAD * (_Direction) * Utils.RAD))));
                getLastCreatedActor().setVelocity(_Direction, (_MinimumSpeed + (randomFloat() * _MaximumSpeed)));
                getLastCreatedActor().setAngularVelocity(Utils.RAD * ((-(_MaximumTurningSpeed) + ((randomFloat() * _MaximumTurningSpeed) * 2))));
}

}

        if((hasValue(_ExplosionActorType) != false))
{
            createRecycledActor(_ExplosionActorType, 0, 0, Script.FRONT);
            getLastCreatedActor().setX((actor.getXCenter() - (getLastCreatedActor().getWidth()/2)));
            getLastCreatedActor().setY((actor.getYCenter() - (getLastCreatedActor().getHeight()/2)));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}