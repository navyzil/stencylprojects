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



class Design_57_57_HealthManager extends ActorScript
{          	
	
public var _StartingHealth:Float;

public var _MaximumHealth:Float;

public var _CurrentHealth:Float;

public var _HealedMessage:String;

public var _DamagedMessage:String;

public var _ZeroHealthAction:String;

public var _Invincible:Bool;

public var _DelayBetweenDamage:Float;

public var _CanBeDamaged:Bool;

public var _PersistentHealth:Bool;

public var _HealthIdentifier:String;

public var _DamageSound:Sound;

public var _HealthDepletedMessage:String;

public var _HealSound:Sound;

public var _HealthDepletedSound:Sound;
    
/* ========================= Custom Block ========================= */


/* Params are:__Self __Amount */
public function _customBlock_Heal(__Amount:Float):Void
{
var __Self:Actor = actor;
        /* "Make sure health doesn't exceed the maximum amount" */
        _CurrentHealth = asNumber(Math.min((_CurrentHealth + __Amount), _MaximumHealth));
propertyChanged("_CurrentHealth", _CurrentHealth);
        _customEvent_UpdateGlobalHealth();
        if((hasValue(_HealedMessage) != false))
{
            actor.shout("_customEvent_" + _HealedMessage);
}

        if((hasValue(_HealSound) != false))
{
            playSound(_HealSound);
}

}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self __Amount */
public function _customBlock_Damage(__Amount:Float):Void
{
var __Self:Actor = actor;
        /* "Don't take any damage if we're invincible" */
        if(((_Invincible || !(_CanBeDamaged)) || (_CurrentHealth <= 0)))
{
            return;
}

        /* "Make sure health doesn't drop below zero" */
        _CurrentHealth = asNumber(Math.max((_CurrentHealth - __Amount), 0));
propertyChanged("_CurrentHealth", _CurrentHealth);
        _customEvent_UpdateGlobalHealth();
        /* "Check if Actor has depleted its health" */
        if((_CurrentHealth <= 0))
{
            if((hasValue(_HealthDepletedMessage) != false))
{
                if(actor.hasBehavior("Lives Manager"))
{
                    setGameAttribute(_HealthIdentifier, _StartingHealth);
}

                actor.shout("_customEvent_" + _HealthDepletedMessage);
}

            if((hasValue(_HealthDepletedSound) != false))
{
                playSound(_HealthDepletedSound);
}

}

        else
{
            if((hasValue(_DamagedMessage) != false))
{
                actor.shout("_customEvent_" + _DamagedMessage);
}

            if((hasValue(_DamageSound) != false))
{
                playSound(_DamageSound);
}

            /* "Set up a delay so that the Actor can't be damaged again for this many seconds." */
            if((_DelayBetweenDamage > 0))
{
                _CanBeDamaged = false;
propertyChanged("_CanBeDamaged", _CanBeDamaged);
                runLater(1000 * _DelayBetweenDamage, function(timeTask:TimedTask):Void {
                            if(actor.isAlive())
{
                                _CanBeDamaged = true;
propertyChanged("_CanBeDamaged", _CanBeDamaged);
}

}, actor);
}

}

}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self */
public function _customBlock_FullRestore():Void
{
var __Self:Actor = actor;
        _CurrentHealth = asNumber(_MaximumHealth);
propertyChanged("_CurrentHealth", _CurrentHealth);
        _customEvent_UpdateGlobalHealth();
}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self */
public function _customBlock_GetCurrentHealth():Float
{
var __Self:Actor = actor;
        return _CurrentHealth;
}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self */
public function _customBlock_GetMaxHealth():Float
{
var __Self:Actor = actor;
        return _MaximumHealth;
}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self __Status */
public function _customBlock_SetInvincibility(__Status:Bool):Void
{
var __Self:Actor = actor;
        _Invincible = __Status;
propertyChanged("_Invincible", _Invincible);
}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self __Amount */
public function _customBlock_SetHealth(__Amount:Float):Void
{
var __Self:Actor = actor;
        _CurrentHealth = asNumber(Math.min(__Amount, _MaximumHealth));
propertyChanged("_CurrentHealth", _CurrentHealth);
        _CurrentHealth = asNumber(Math.max(__Amount, 0));
propertyChanged("_CurrentHealth", _CurrentHealth);
        _customEvent_UpdateGlobalHealth();
}
    
/* ========================= Custom Block ========================= */


/* Params are:__Self */
public function _customBlock_GetInvincibility():Bool
{
var __Self:Actor = actor;
        return _Invincible;
}
    public function _customEvent_UpdateGlobalHealth():Void
{
        if(_PersistentHealth)
{
            setGameAttribute(_HealthIdentifier, asNumber(_CurrentHealth));
}

}

    
/* ========================= Custom Block ========================= */


/* Params are:__Self __TakeDamage */
public function _customBlock_SetCanDamage(__TakeDamage:Bool):Void
{
var __Self:Actor = actor;
        _CanBeDamaged = __TakeDamage;
propertyChanged("_CanBeDamaged", _CanBeDamaged);
}

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Starting Health", "_StartingHealth");
_StartingHealth = 3.0;
nameMap.set("Maximum Health", "_MaximumHealth");
_MaximumHealth = 3.0;
nameMap.set("Current Health", "_CurrentHealth");
_CurrentHealth = 3.0;
nameMap.set("Healed Message", "_HealedMessage");
_HealedMessage = "Healed";
nameMap.set("Damaged Message", "_DamagedMessage");
_DamagedMessage = "Damaged";
nameMap.set("Zero Health Action", "_ZeroHealthAction");
_ZeroHealthAction = "";
nameMap.set("Invincible?", "_Invincible");
_Invincible = false;
nameMap.set("Delay Between Damage", "_DelayBetweenDamage");
_DelayBetweenDamage = 0.5;
nameMap.set("Can Be Damaged?", "_CanBeDamaged");
_CanBeDamaged = true;
nameMap.set("Persistent Health?", "_PersistentHealth");
_PersistentHealth = false;
nameMap.set("Health Identifier", "_HealthIdentifier");
_HealthIdentifier = "";
nameMap.set("Damage Sound", "_DamageSound");
nameMap.set("Actor", "actor");
nameMap.set("Health Depleted Message", "_HealthDepletedMessage");
_HealthDepletedMessage = "";
nameMap.set("Heal Sound", "_HealSound");
nameMap.set("Health Depleted Sound", "_HealthDepletedSound");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        _CurrentHealth = asNumber(_StartingHealth);
propertyChanged("_CurrentHealth", _CurrentHealth);
        _CanBeDamaged = true;
propertyChanged("_CanBeDamaged", _CanBeDamaged);
        if(_PersistentHealth)
{
            if(!(((asNumber((getGameAttribute(_HealthIdentifier))) <= 0) || (asNumber((getGameAttribute(_HealthIdentifier))) >= 0))))
{
                setGameAttribute(_HealthIdentifier, asNumber(_CurrentHealth));
}

            else
{
                _CurrentHealth = asNumber(asNumber((getGameAttribute(_HealthIdentifier))));
propertyChanged("_CurrentHealth", _CurrentHealth);
}

            if((_CurrentHealth <= 0))
{
                /* "Trying to spawn with no health, deal the death blow!" */
                if((_ZeroHealthAction == "Kill"))
{
                    recycleActor(actor);
}

                else if((_ZeroHealthAction == "Recycle"))
{
                    recycleActor(actor);
}

}

}


	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}