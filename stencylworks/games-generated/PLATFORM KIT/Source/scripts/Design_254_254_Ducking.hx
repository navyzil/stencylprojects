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



class Design_254_254_Ducking extends ActorScript
{          	
	
public var _DuckKey:String;

public var _DuckRightAnimation:String;

public var _DuckLeftAnimation:String;

public var _AnimationCategory:String;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Duck Key", "_DuckKey");
nameMap.set("Duck Right Animation", "_DuckRightAnimation");
nameMap.set("Duck Left Animation", "_DuckLeftAnimation");
nameMap.set("Animation Category", "_AnimationCategory");
_AnimationCategory = "Ducking";
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            /* "Inputs:---------------------" */
        /* "\"Facing Right?\" -- <Boolean> Actor Level Attribute, set in \"Walking\" Behavior (required)" */
        /* "Outputs:-------------------" */
        /* "\"Is Ducking?\" -- <Boolean> Actor Level Attribute" */
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(isKeyDown(_DuckKey))
{
            actor.setActorValue("Is Ducking?", true);
            if(asBoolean(actor.getActorValue("Facing Right?")))
{
                actor.say("Animation Manager", "_customBlock_LoopAnim", [_DuckRightAnimation,_AnimationCategory]);
}

            else
{
                actor.say("Animation Manager", "_customBlock_LoopAnim", [_DuckLeftAnimation,_AnimationCategory]);
}

}

        else
{
            actor.setActorValue("Is Ducking?", false);
            actor.say("Animation Manager", "_customBlock_ClearAnimCat", [_AnimationCategory]);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}