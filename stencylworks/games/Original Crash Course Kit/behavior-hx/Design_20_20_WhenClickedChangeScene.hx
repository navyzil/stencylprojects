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



class Design_20_20_WhenClickedChangeScene extends ActorScript
{          	
	
public var _ReloadTime1:Float;

public var _ReloadTime2:Float;

public var _ScenetoSwitchto:Scene;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Reload Time 1", "_ReloadTime1");
_ReloadTime1 = 0.0;
nameMap.set("Reload Time 2", "_ReloadTime2");
_ReloadTime2 = 0.0;
nameMap.set("Scene to Switch to", "_ScenetoSwitchto");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void {
if(wrapper.enabled && 3 == mouseState){
        switchScene(_ScenetoSwitchto.getID(), createFadeOut((_ReloadTime1)),createFadeIn((_ReloadTime2)));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}