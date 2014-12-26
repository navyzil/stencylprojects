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
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.events.Event;
import nme.events.TouchEvent;
import nme.net.URLLoader;

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



class Design_10_10_FireBullet extends ActorScript
{          	
	
public var _DirectionMode:String;

public var _BulletSpeed:Float;

public var _BulletType:ActorType;

public var _Direction:Float;

public var _Offset:Float;

public var _FireControl:String;

public var _FireDirection:Float;

public var _UsetheMouse:Bool;

public var _UseControls:Bool;

public var _MaximumBulletsAlive:Float;

public var _LimitBulletsAlive:Bool;

public var _Fire:Bool;

public var _BulletsAlive:Float;

public var _RateOfFire:Float;

public var _Wait:Bool;

public var _CurrentAmmunition:Float;

public var _MaximumAmmunition:Float;

public var _UseAmmunition:Bool;

public var _DownAnimations:String;

public var _UpAnimations:String;

public var _RightAnimations:String;

public var _LeftAnimations:String;
    public function _customEvent_FireBullet():Void
{
        _Fire = true;
propertyChanged("_Fire", _Fire);
}

    public function _customEvent_Reload():Void
{
        _CurrentAmmunition = asNumber(_MaximumAmmunition);
propertyChanged("_CurrentAmmunition", _CurrentAmmunition);
}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Direction Mode", "_DirectionMode");
_DirectionMode = "";
nameMap.set("Bullet Speed", "_BulletSpeed");
_BulletSpeed = 50.0;
nameMap.set("Bullet Type", "_BulletType");
nameMap.set("Direction", "_Direction");
_Direction = 0.0;
nameMap.set("Offset", "_Offset");
_Offset = 0.0;
nameMap.set("Fire Control", "_FireControl");
nameMap.set("Actor", "actor");
nameMap.set("Fire Direction", "_FireDirection");
_FireDirection = 0.0;
nameMap.set("Use the Mouse", "_UsetheMouse");
_UsetheMouse = true;
nameMap.set("Use Controls", "_UseControls");
_UseControls = true;
nameMap.set("Maximum Bullets Alive", "_MaximumBulletsAlive");
_MaximumBulletsAlive = 1.0;
nameMap.set("Limit Bullets Alive", "_LimitBulletsAlive");
_LimitBulletsAlive = false;
nameMap.set("Fire", "_Fire");
_Fire = false;
nameMap.set("Bullets Alive", "_BulletsAlive");
_BulletsAlive = 0.0;
nameMap.set("Rate Of Fire", "_RateOfFire");
_RateOfFire = 3.0;
nameMap.set("Wait", "_Wait");
_Wait = false;
nameMap.set("Current Ammunition", "_CurrentAmmunition");
_CurrentAmmunition = 5.0;
nameMap.set("Maximum Ammunition", "_MaximumAmmunition");
_MaximumAmmunition = 5.0;
nameMap.set("Use Ammunition", "_UseAmmunition");
_UseAmmunition = false;
nameMap.set("Down Animations", "_DownAnimations");
_DownAnimations = "";
nameMap.set("Up Animations", "_UpAnimations");
_UpAnimations = "";
nameMap.set("Right Animations", "_RightAnimations");
_RightAnimations = "";
nameMap.set("Left Animations", "_LeftAnimations");
_LeftAnimations = "";

	}
	
	override public function init()
	{
		    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((hasValue(_BulletType) != false))
{
            if(_UsetheMouse)
{
                _Fire = (_Fire || isMouseDown());
propertyChanged("_Fire", _Fire);
}

            if(_UseControls)
{
                _Fire = (_Fire || isKeyDown(_FireControl));
propertyChanged("_Fire", _Fire);
}

            if(_Fire)
{
                _Fire = false;
propertyChanged("_Fire", _Fire);
                if(_LimitBulletsAlive)
{
                    _BulletsAlive = asNumber(0);
propertyChanged("_BulletsAlive", _BulletsAlive);
                    for(actorOfType in getActorsOfType(_BulletType))
{
if(actorOfType != null && !actorOfType.dead && !actorOfType.recycled){
                        if((actorOfType.getActorValue("FireBullet_Creator") == actor))
{
                            _BulletsAlive += 1;
propertyChanged("_BulletsAlive", _BulletsAlive);
                            if((_BulletsAlive >= _MaximumBulletsAlive))
{
                                return;
}

}

}
}

}

                if((!(_Wait) && (!(_UseAmmunition) || (_CurrentAmmunition > 0))))
{
                    _Wait = true;
propertyChanged("_Wait", _Wait);
                    runLater(1000 * (1 / _RateOfFire), function(timeTask:TimedTask):Void {
                                if(actor.isAlive())
{
                                    _Wait = false;
propertyChanged("_Wait", _Wait);
}

}, actor);
                    createRecycledActor(_BulletType, 0, 0, Script.FRONT);
                    if((_DirectionMode == "Based on Animations"))
{
                        if((!(("" + _UpAnimations) == ("")) && (("" + ("" + actor.getAnimation())).indexOf(_UpAnimations) >= 0)))
{
                            _FireDirection = asNumber(-90);
propertyChanged("_FireDirection", _FireDirection);
}

                        else if((!(("" + _DownAnimations) == ("")) && (("" + ("" + actor.getAnimation())).indexOf(_DownAnimations) >= 0)))
{
                            _FireDirection = asNumber(90);
propertyChanged("_FireDirection", _FireDirection);
}

                        else if((!(("" + _LeftAnimations) == ("")) && (("" + ("" + actor.getAnimation())).indexOf(_LeftAnimations) >= 0)))
{
                            _FireDirection = asNumber(180);
propertyChanged("_FireDirection", _FireDirection);
}

                        else if((!(("" + _RightAnimations) == ("")) && (("" + ("" + actor.getAnimation())).indexOf(_RightAnimations) >= 0)))
{
                            _FireDirection = asNumber(0);
propertyChanged("_FireDirection", _FireDirection);
}

}

                    else if((_DirectionMode == "Absolute"))
{
                        _FireDirection = asNumber(_Direction);
propertyChanged("_FireDirection", _FireDirection);
}

                    else if((_DirectionMode == "Relative"))
{
                        _FireDirection = asNumber((Utils.DEG * (actor.getAngle()) + _Direction));
propertyChanged("_FireDirection", _FireDirection);
}

                    if(_UseAmmunition)
{
                        _CurrentAmmunition -= 1;
propertyChanged("_CurrentAmmunition", _CurrentAmmunition);
}

                    getLastCreatedActor().setX(((actor.getXCenter() - getLastCreatedActor().getWidth()/2) + (_Offset * Math.cos(Utils.RAD * (_FireDirection)))));
                    getLastCreatedActor().setY(((actor.getYCenter() - getLastCreatedActor().getHeight()/2) + (_Offset * Math.sin(Utils.RAD * (_FireDirection)))));
                    getLastCreatedActor().setVelocity(_FireDirection, _BulletSpeed);
                    getLastCreatedActor().setActorValue("FireBullet_Creator", actor);
}

}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}