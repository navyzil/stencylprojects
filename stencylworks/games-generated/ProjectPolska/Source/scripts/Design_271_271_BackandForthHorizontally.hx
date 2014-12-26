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



class Design_271_271_BackandForthHorizontally extends ActorScript
{          	
	
public var _DistanceLeft:Float;

public var _Speed:Float;

public var _InitialDirection:Float;

public var _DistanceRight:Float;

public var _ChangeDirectiononCollision:Bool;

public var _Start:Float;

public var _End:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Distance Left", "_DistanceLeft");
_DistanceLeft = 100.0;
nameMap.set("Speed", "_Speed");
_Speed = 10.0;
nameMap.set("Initial Direction", "_InitialDirection");
_InitialDirection = 0.0;
nameMap.set("Distance Right", "_DistanceRight");
_DistanceRight = 100.0;
nameMap.set("Change Direction on Collision", "_ChangeDirectiononCollision");
_ChangeDirectiononCollision = true;
nameMap.set("Start", "_Start");
_Start = 0.0;
nameMap.set("End", "_End");
_End = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            actor.makeAlwaysSimulate();
        _Start = asNumber((actor.getXCenter() - _DistanceLeft));
propertyChanged("_Start", _Start);
        _End = asNumber((actor.getXCenter() + _DistanceRight));
propertyChanged("_End", _End);
        actor.setXVelocity((_InitialDirection * _Speed));
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((actor.getXCenter() > _End))
{
            actor.setXVelocity(-(_Speed));
}

        else if((actor.getXCenter() < _Start))
{
            actor.setXVelocity(_Speed);
}

}
});
    addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(_ChangeDirectiononCollision)
{
            if(event.thisFromLeft)
{
                actor.setXVelocity(_Speed);
}

            if(event.thisFromRight)
{
                actor.setXVelocity(-(_Speed));
}

}

}
});
    addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((sceneHasBehavior("Game Debugger") && asBoolean(getValueForScene("Game Debugger", "_Enabled"))))
{
            g.strokeColor = getValueForScene("Game Debugger", "_CustomColor");
            g.strokeSize = Std.int(getValueForScene("Game Debugger", "_StrokeThickness"));
            g.translateToScreen();
            g.drawLine((_Start - getScreenX()), (actor.getYCenter() - getScreenY()), (_End - getScreenX()), (actor.getYCenter() - getScreenY()));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}