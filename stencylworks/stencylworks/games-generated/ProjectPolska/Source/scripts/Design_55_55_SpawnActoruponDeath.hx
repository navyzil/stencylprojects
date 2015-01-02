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



class Design_55_55_SpawnActoruponDeath extends ActorScript
{          	
	
public var actTypeToSpawn:ActorType;

public var xOffset:Float;

public var yOffset:Float;

public var lifespan:Float;

public var _DeathMessage:String;

public var _SpawnType:String;

public var _SpawnedActor:Actor;

public var _Spawned:Bool;
    public function _customEvent_whenThisHears_DeathMessage():Void
{
        if(_Spawned)
{
            return;
}

        _Spawned = true;
propertyChanged("_Spawned", _Spawned);
        if((_SpawnType == "Normal"))
{
            createRecycledActor(actTypeToSpawn, (actor.getX() + xOffset), (actor.getY() + yOffset), Script.FRONT);
            _SpawnedActor = getLastCreatedActor();
propertyChanged("_SpawnedActor", _SpawnedActor);
}

        else
{
            createRecycledActor(actTypeToSpawn, (actor.getX() + xOffset), (actor.getY() + yOffset), Script.FRONT);
            _SpawnedActor = getLastCreatedActor();
propertyChanged("_SpawnedActor", _SpawnedActor);
}

        if((lifespan > 0))
{
            runLater(1000 * lifespan, function(timeTask:TimedTask):Void {
                        if(((hasValue(_SpawnedActor) != false) && _SpawnedActor.isAlive()))
{
                            if((_SpawnType == "Normal"))
{
                                recycleActor(_SpawnedActor);
}

                            else
{
                                recycleActor(_SpawnedActor);
}

}

}, actor);
}

}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Actor Type to Spawn", "actTypeToSpawn");
nameMap.set("X Offset", "xOffset");
xOffset = 0.0;
nameMap.set("Y Offset", "yOffset");
yOffset = 0.0;
nameMap.set("Lifespan", "lifespan");
lifespan = 0.0;
nameMap.set("Death Message", "_DeathMessage");
_DeathMessage = "Death";
nameMap.set("Spawn Type", "_SpawnType");
_SpawnType = "";
nameMap.set("Spawned Actor", "_SpawnedActor");
nameMap.set("Spawned?", "_Spawned");
_Spawned = false;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */


	}	      	
	
	override public function forwardMessage(msg:String)
	{
		if(msg == ("_customEvent_" + _DeathMessage))
{
_customEvent_whenThisHears_DeathMessage();
return;
}

	}
}