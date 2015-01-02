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



class Design_62_62_LivesManager extends ActorScript
{          	
	
public var _MaximumLives:Float;

public var _StartingLives:Float;

public var _CurrentLives:Float;

public var _PersistentLives:Bool;

public var _LivesIdentifier:String;

public var _HealthDepletedMessage:String;

public var _SendLostLifeMessage:String;

public var _SendDeathMessage:String;
    public function _customEvent_whenThisHears_HealthDepletedMessage():Void
{
        actor.say("Lives Manager", "_customBlock_DecrementLives", [1]);
}

    public function _customEvent_UpdateGlobalLives():Void
{
        if(_PersistentLives)
{
            setGameAttribute(_LivesIdentifier, _CurrentLives);
}

}

    
/* ========================= Custom Block ========================= */


/* Params are:__Self __Lives */
public function _customBlock_IncrementLives(__Lives:Float):Void
{
var __Self:Actor = actor;
        _CurrentLives = asNumber(Math.min((_CurrentLives + __Lives), _MaximumLives));
propertyChanged("_CurrentLives", _CurrentLives);
        _customEvent_UpdateGlobalLives();
}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self __Lives */
public function _customBlock_DecrementLives(__Lives:Float):Void
{
var __Self:Actor = actor;
        _CurrentLives = asNumber(Math.max((_CurrentLives - __Lives), 0));
propertyChanged("_CurrentLives", _CurrentLives);
        _customEvent_UpdateGlobalLives();
        if((_CurrentLives <= 0))
{
            actor.shout("_customEvent_" + _SendDeathMessage);
}

        else
{
            actor.shout("_customEvent_" + _SendLostLifeMessage);
}

}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self */
public function _customBlock_GetRemainingLives():Float
{
var __Self:Actor = actor;
        return _CurrentLives;
}

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Maximum Lives", "_MaximumLives");
_MaximumLives = 0.0;
nameMap.set("Starting Lives", "_StartingLives");
_StartingLives = 0.0;
nameMap.set("Current Lives", "_CurrentLives");
_CurrentLives = 0.0;
nameMap.set("Persistent Lives?", "_PersistentLives");
_PersistentLives = false;
nameMap.set("Lives Identifier", "_LivesIdentifier");
_LivesIdentifier = "";
nameMap.set("Health Depleted Message", "_HealthDepletedMessage");
_HealthDepletedMessage = "HealthDepleted";
nameMap.set("Send Lost Life Message", "_SendLostLifeMessage");
_SendLostLifeMessage = "LifeLost";
nameMap.set("Send Death Message", "_SendDeathMessage");
_SendDeathMessage = "Death";
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _CurrentLives = asNumber(_StartingLives);
propertyChanged("_CurrentLives", _CurrentLives);
        if(_PersistentLives)
{
            if(!(((asNumber((getGameAttribute(_LivesIdentifier))) <= 0) || (asNumber((getGameAttribute(_LivesIdentifier))) >= 0))))
{
                setGameAttribute(_LivesIdentifier, asNumber(_CurrentLives));
}

            else
{
                _CurrentLives = asNumber(asNumber((getGameAttribute(_LivesIdentifier))));
propertyChanged("_CurrentLives", _CurrentLives);
}

}


	}	      	
	
	override public function forwardMessage(msg:String)
	{
		if(msg == ("_customEvent_" + _HealthDepletedMessage))
{
_customEvent_whenThisHears_HealthDepletedMessage();
return;
}

	}
}