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
import nme.display.BitmapData;
import nme.display.Bitmap;
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



class Design_17_17_NewBlockBehavior extends ActorScript
{          	
	
public var _Position:Float;

public var _RandomNumber:Float;

public var _DefaultAnimation:String;

public var _Loading:Bool;

public var _SwapDelay:Float;

public var _SecondActor:Actor;

public var _NormalAnimationList:Array<Dynamic>;

public var _SelectedAnimationList:Array<Dynamic>;

public var _UniqueBlocks:Float;

public var _ScoreValue:Float;
    public function _customEvent_mouseDown():Void
{
        if((cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor) == actor))
{
            /* "If self is already selected, there is nothing else to do." */
            return;
}

        if(((getGameAttribute("Time Since Last Movement") <= 8) || (getGameAttribute("Time Since Last Match") <= 8)))
{
            /* "You can't move pieces shortly after another movement or match.  Be careful not to set these numbers too low." */
            return;
}

        if((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position - 1)])), Actor) == cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor)))
{
            setGameAttribute("Time Since Last Movement", 0);
            _customEvent_swapLeft();
}

        else if((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position + 1)])), Actor) == cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor)))
{
            setGameAttribute("Time Since Last Movement", 0);
            _customEvent_swapRight();
}

        else if((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position - getSceneWidth()/getTileWidth())])), Actor) == cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor)))
{
            setGameAttribute("Time Since Last Movement", 0);
            _customEvent_swapUp();
}

        else if((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position + getSceneWidth()/getTileWidth())])), Actor) == cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor)))
{
            setGameAttribute("Time Since Last Movement", 0);
            _customEvent_swapDown();
}

        else
{
            /* "If this block isn't adjacent to the currently selected block, make this block the new selected block." */
            sayToScene("Scene Functions", "_customBlock_setSelectedActor", [actor]);
}

}

    public function _customEvent_checkMatches():Void
{
        if((getGameAttribute("Time Since Last Movement") < 3))
{
            return;
}

        if(((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position - 1)])), Actor).getAnimation() == actor.getAnimation()) && (cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position + 1)])), Actor).getAnimation() == actor.getAnimation())))
{
            /* "Check left and right." */
            setGameAttribute("Time Since Last Match", 0);
            cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position - 1)])), Actor).say("Block Behavior", "_customBlock_killAfterDelay", [0.1]);
            cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position + 1)])), Actor).say("Block Behavior", "_customBlock_killAfterDelay", [0.1]);
            actor.say("Block Behavior", "_customBlock_killAfterDelay", [0.1]);
}

        else if(((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position - getSceneWidth()/getTileWidth())])), Actor).getAnimation() == actor.getAnimation()) && (cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position + getSceneWidth()/getTileWidth())])), Actor).getAnimation() == actor.getAnimation())))
{
            /* "Check up and down." */
            setGameAttribute("Time Since Last Match", 0);
            cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position - getSceneWidth()/getTileWidth())])), Actor).say("Block Behavior", "_customBlock_killAfterDelay", [0.1]);
            cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position + getSceneWidth()/getTileWidth())])), Actor).say("Block Behavior", "_customBlock_killAfterDelay", [0.1]);
            actor.say("Block Behavior", "_customBlock_killAfterDelay", [0.1]);
}

}

    public function _customEvent_swapLeft():Void
{
        _SecondActor = cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor);
propertyChanged("_SecondActor", _SecondActor);
        /* "When blocks move, the selected actor changes back to normal." */
        sayToScene("Scene Functions", "_customBlock_setSelectedActor", [cast((sayToScene("Scene Functions", "_customBlock_getNullActor")), Actor)]);
        actor.setX((actor.getX() - getTileWidth()));
        _SecondActor.setX((_SecondActor.getX() + getTileWidth()));
        _Position = asNumber((_Position - 1));
propertyChanged("_Position", _Position);
        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) + 1)]);
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position + 1))] = _SecondActor;
        runLater(1000 * _SwapDelay, function(timeTask:TimedTask):Void {
                    if((getGameAttribute("Time Since Last Match") >= 4))
{
                        /* "If no match is made, move the actors back to their previous positions." */
                        actor.setX((actor.getX() + getTileWidth()));
                        _SecondActor.setX((_SecondActor.getX() - getTileWidth()));
                        _Position = asNumber((_Position + 1));
propertyChanged("_Position", _Position);
                        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) - 1)]);
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position - 1))] = _SecondActor;
}

}, actor);
}

    public function _customEvent_swapRight():Void
{
        _SecondActor = cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor);
propertyChanged("_SecondActor", _SecondActor);
        /* "When blocks move, the selected actor changes back to normal." */
        sayToScene("Scene Functions", "_customBlock_setSelectedActor", [cast((sayToScene("Scene Functions", "_customBlock_getNullActor")), Actor)]);
        actor.setX((actor.getX() + getTileWidth()));
        _SecondActor.setX((_SecondActor.getX() - getTileWidth()));
        _Position = asNumber((_Position + 1));
propertyChanged("_Position", _Position);
        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) - 1)]);
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position - 1))] = _SecondActor;
        runLater(1000 * _SwapDelay, function(timeTask:TimedTask):Void {
                    if((getGameAttribute("Time Since Last Match") >= 4))
{
                        /* "If no match is made, move the actors back to their previous positions." */
                        actor.setX((actor.getX() - getTileWidth()));
                        _SecondActor.setX((_SecondActor.getX() + getTileWidth()));
                        _Position = asNumber((_Position - 1));
propertyChanged("_Position", _Position);
                        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) + 1)]);
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position + 1))] = _SecondActor;
}

}, actor);
}

    public function _customEvent_swapUp():Void
{
        _SecondActor = cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor);
propertyChanged("_SecondActor", _SecondActor);
        /* "When blocks move, the selected actor changes back to normal." */
        sayToScene("Scene Functions", "_customBlock_setSelectedActor", [cast((sayToScene("Scene Functions", "_customBlock_getNullActor")), Actor)]);
        actor.setY((actor.getY() - getTileHeight()));
        _SecondActor.setY((_SecondActor.getY() + getTileHeight()));
        _Position = asNumber((_Position - getSceneWidth()/getTileWidth()));
propertyChanged("_Position", _Position);
        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) + getSceneWidth()/getTileWidth())]);
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position + getSceneWidth()/getTileWidth()))] = _SecondActor;
        runLater(1000 * _SwapDelay, function(timeTask:TimedTask):Void {
                    if((getGameAttribute("Time Since Last Match") >= 4))
{
                        /* "If no match is made, move the actors back to their previous positions." */
                        actor.setY((actor.getY() + getTileHeight()));
                        _SecondActor.setY((_SecondActor.getY() - getTileHeight()));
                        _Position = asNumber((_Position + getSceneWidth()/getTileWidth()));
propertyChanged("_Position", _Position);
                        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) - getSceneWidth()/getTileWidth())]);
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position - getSceneWidth()/getTileWidth()))] = _SecondActor;
}

}, actor);
}

    public function _customEvent_swapDown():Void
{
        _SecondActor = cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor);
propertyChanged("_SecondActor", _SecondActor);
        /* "When blocks move, the selected actor changes back to normal." */
        sayToScene("Scene Functions", "_customBlock_setSelectedActor", [cast((sayToScene("Scene Functions", "_customBlock_getNullActor")), Actor)]);
        actor.setY((actor.getY() + getTileHeight()));
        _SecondActor.setY((_SecondActor.getY() - getTileHeight()));
        _Position = asNumber((_Position + getSceneWidth()/getTileWidth()));
propertyChanged("_Position", _Position);
        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) - getSceneWidth()/getTileWidth())]);
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position - getSceneWidth()/getTileWidth()))] = _SecondActor;
        runLater(1000 * _SwapDelay, function(timeTask:TimedTask):Void {
                    if((getGameAttribute("Time Since Last Match") >= 4))
{
                        /* "If no match is made, move the actors back to their previous positions." */
                        actor.setY((actor.getY() - getTileHeight()));
                        _SecondActor.setY((_SecondActor.getY() + getTileHeight()));
                        _Position = asNumber((_Position - getSceneWidth()/getTileWidth()));
propertyChanged("_Position", _Position);
                        _SecondActor.say("Block Behavior", "_customBlock_setPosition", [(cast((_SecondActor.say("Block Behavior", "_customBlock_getPosition")), Float) + getSceneWidth()/getTileWidth())]);
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
                        cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int((_Position + getSceneWidth()/getTileWidth()))] = _SecondActor;
}

}, actor);
}

    

/* Params are:__Self */
public function _customBlock_getPosition():Float
{
var __Self:Actor = actor;
        return _Position;
}
    

/* Params are:__Self __Number */
public function _customBlock_setPosition(__Number:Float):Void
{
var __Self:Actor = actor;
        _Position = asNumber(__Number);
propertyChanged("_Position", _Position);
}
    

/* Params are:__Self __Delay */
public function _customBlock_killAfterDelay(__Delay:Float):Void
{
var __Self:Actor = actor;
        runLater(1000 * __Delay, function(timeTask:TimedTask):Void {
                    cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = "None";
                    sayToScene("Scene Functions", "_customBlock_matchSound");
                    setGameAttribute("Score", (getGameAttribute("Score") + _ScoreValue));
                    recycleActor(actor);
}, actor);
}

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Position", "_Position");
_Position = 0.0;
nameMap.set("Random Number", "_RandomNumber");
_RandomNumber = 0.0;
nameMap.set("Default Animation", "_DefaultAnimation");
nameMap.set("Loading", "_Loading");
_Loading = false;
nameMap.set("Swap Delay", "_SwapDelay");
_SwapDelay = 0.0;
nameMap.set("Second Actor", "_SecondActor");
nameMap.set("Normal Animation List", "_NormalAnimationList");
_NormalAnimationList = [];
nameMap.set("Selected Animation List", "_SelectedAnimationList");
_SelectedAnimationList = [];
nameMap.set("Unique Blocks", "_UniqueBlocks");
_UniqueBlocks = 0.0;
nameMap.set("Score Value", "_ScoreValue");
_ScoreValue = 100.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            _Loading = true;
propertyChanged("_Loading", _Loading);
        _SwapDelay = asNumber(0.35);
propertyChanged("_SwapDelay", _SwapDelay);
        if((hasValue(_ScoreValue) == false))
{
            _ScoreValue = asNumber(100);
propertyChanged("_ScoreValue", _ScoreValue);
}

        _Position = asNumber(((actor.getX() / getTileWidth()) + ((actor.getY() / getTileHeight()) * getSceneWidth()/getTileWidth())));
propertyChanged("_Position", _Position);
        _RandomNumber = asNumber(randomInt(Math.floor(0), Math.floor((_UniqueBlocks - 1))));
propertyChanged("_RandomNumber", _RandomNumber);
        if(getGameAttribute("Scene Start"))
{
            /* "Control animations at the start of the scene so matches are not possible." */
            /* "Animations are chosen based on the position of each block." */
            if(((((actor.getX() / getTileWidth()) + (actor.getY() / getTileHeight())) % 2) == 0))
{
                if(!(cast((sayToScene("Scene Functions", "_customBlock_isNumberEven", [_RandomNumber])), Bool)))
{
                    if((_RandomNumber == (_UniqueBlocks - 1)))
{
                        _RandomNumber = asNumber(0);
propertyChanged("_RandomNumber", _RandomNumber);
}

                    else
{
                        _RandomNumber = asNumber((_RandomNumber + 1));
propertyChanged("_RandomNumber", _RandomNumber);
}

}

}

            else
{
                if(cast((sayToScene("Scene Functions", "_customBlock_isNumberEven", [_RandomNumber])), Bool))
{
                    if((_RandomNumber == (_UniqueBlocks - 1)))
{
                        _RandomNumber = asNumber(1);
propertyChanged("_RandomNumber", _RandomNumber);
}

                    else
{
                        _RandomNumber = asNumber((_RandomNumber + 1));
propertyChanged("_RandomNumber", _RandomNumber);
}

}

}

}

        actor.setAnimation("" + ("" + _NormalAnimationList[Std.int(_RandomNumber)]));
        _DefaultAnimation = actor.getAnimation();
propertyChanged("_DefaultAnimation", _DefaultAnimation);
        runLater(1000 * 0.05, function(timeTask:TimedTask):Void {
                    /* "This delay ensures the scene list is created first." */
                    cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
                    /* "The Loading attribute makes sure the blocks under Always aren't checked until the block adds itself to the Position List." */
                    _Loading = false;
propertyChanged("_Loading", _Loading);
}, actor);
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(_Loading)
{
            return;
}

        if(actor.isMouseDown())
{
            _customEvent_mouseDown();
}

        if((cast((sayToScene("Scene Functions", "_customBlock_getSelectedActor")), Actor) == actor))
{
            if(!(actor.getAnimation() == ("" + _SelectedAnimationList[Std.int(_RandomNumber)])))
{
                /* "If self is selected, make sure the selected animation is used." */
                actor.setAnimation("" + ("" + _SelectedAnimationList[Std.int(_RandomNumber)]));
}

}

        else
{
            if(!(actor.getAnimation() == _DefaultAnimation))
{
                /* "If self is no longer selected, revert to the original animation." */
                actor.setAnimation("" + _DefaultAnimation);
}

}

        if((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_Position + getSceneWidth()/getTileWidth())])), Actor).getType() == getActorType(19)))
{
            /* "The space under this block is empty, so move down." */
            cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = "None";
            actor.setY((actor.getY() + getTileHeight()));
            _Position = asNumber((_Position + getSceneWidth()/getTileWidth()));
propertyChanged("_Position", _Position);
            cast((sayToScene("Scene Functions", "_customBlock_getPositionList")), Array<Dynamic>)[Std.int(_Position)] = actor;
}

        _customEvent_checkMatches();
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}