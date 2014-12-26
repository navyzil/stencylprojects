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



class Design_18_18_SceneFunctions extends SceneScript
{          	
	
public var _PositionList:Array<Dynamic>;

public var _SelectedActor:Actor;

public var _NullActor:Actor;

public var _MatchSound:Sound;

public var _SoundDelay:Bool;
    

/* Params are:*/
public function _customBlock_getPositionList():Array<Dynamic>
{
        return _PositionList;
}
    

/* Params are:*/
public function _customBlock_getSelectedActor():Actor
{
        return _SelectedActor;
}
    

/* Params are:__NewActor */
public function _customBlock_setSelectedActor(__NewActor:Actor):Void
{
        _SelectedActor = __NewActor;
propertyChanged("_SelectedActor", _SelectedActor);
}
    

/* Params are:__Position */
public function _customBlock_getTheActor(__Position:Float):Actor
{
        if((_PositionList[Std.int(__Position)] == "None"))
{
            return _NullActor;
}

        else
{
            return _PositionList[Std.int(__Position)];
}

}
    

/* Params are:*/
public function _customBlock_getNullActor():Actor
{
        return _NullActor;
}
    

/* Params are:*/
public function _customBlock_matchSound():Void
{
        /* "The boolean attribute and delay make sure that the match sound isn't spammed too much.  Adjust the timer if you want." */
        if(!(_SoundDelay))
{
            playSound(_MatchSound);
            _SoundDelay = true;
propertyChanged("_SoundDelay", _SoundDelay);
            runLater(1000 * 0.2, function(timeTask:TimedTask):Void {
                        _SoundDelay = false;
propertyChanged("_SoundDelay", _SoundDelay);
}, null);
}

}
    

/* Params are:__Number */
public function _customBlock_isNumberEven(__Number:Float):Bool
{
        if(((Math.round(__Number) % 2) == 0))
{
            return true;
}

        else
{
            return false;
}

}

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Position List", "_PositionList");
_PositionList = [];
nameMap.set("Selected Actor", "_SelectedActor");
nameMap.set("Null Actor", "_NullActor");
nameMap.set("Match Sound", "_MatchSound");
nameMap.set("Sound Delay", "_SoundDelay");
_SoundDelay = false;

	}
	
	override public function init()
	{
		            _SoundDelay = false;
propertyChanged("_SoundDelay", _SoundDelay);
        setGameAttribute("Scene Start", true);
        setGameAttribute("Time Since Last Movement", 100);
        setGameAttribute("Time Since Last Match", 100);
        /* "Setting hidden lists to \"create new list\" is necessary for them to work properly." */
        _PositionList = new Array<Dynamic>();
propertyChanged("_PositionList", _PositionList);
        for(index0 in 0...Std.int((getSceneWidth()/getTileWidth() * getSceneHeight()/getTileHeight())))
{
            /* "Fill the list so that the replace item block can work properly." */
            _PositionList.push("None");
}

        /* "Null Actor is returned by the getTheActor custom block to represent an empty space." */
        /* "This actor is not seen ingame, and you should not change or remove it." */
        createRecycledActor(getActorType(19), 0, 0, Script.BACK);
        _NullActor = getLastCreatedActor();
propertyChanged("_NullActor", _NullActor);
        /* "When no block is selected, the Selected Actor becomes Null Actor." */
        _SelectedActor = _NullActor;
propertyChanged("_SelectedActor", _SelectedActor);
        runLater(1000 * 0.1, function(timeTask:TimedTask):Void {
                    /* "The blocks use this boolean to control how the animations are chosen." */
                    setGameAttribute("Scene Start", false);
}, null);
        runPeriodically(1000 * 0.1, function(timeTask:TimedTask):Void {
                    /* "These attributes are integers to avoid accuracy problems related to decimal numbers." */
                    setGameAttribute("Time Since Last Movement", (getGameAttribute("Time Since Last Movement") + 1));
                    setGameAttribute("Time Since Last Match", (getGameAttribute("Time Since Last Match") + 1));
}, null);
    addKeyStateListener("R", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        reloadCurrentScene(createRectangleOut((getGameAttribute("Transition Time"))),createRectangleIn((getGameAttribute("Transition Time"))));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}