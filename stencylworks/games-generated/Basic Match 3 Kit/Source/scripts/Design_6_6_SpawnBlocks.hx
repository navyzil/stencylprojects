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



class Design_6_6_SpawnBlocks extends SceneScript
{          	
	
public var _TileXPosition:Float;

public var _BottomRow:Float;

public var _TopRow:Float;

public var _ActorTypetoSpawn:ActorType;

public var _Position:Float;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Tile X Position", "_TileXPosition");
_TileXPosition = 0.0;
nameMap.set("Bottom Row", "_BottomRow");
_BottomRow = 0.0;
nameMap.set("Top Row", "_TopRow");
_TopRow = 0.0;
nameMap.set("Actor Type to Spawn", "_ActorTypetoSpawn");
nameMap.set("Position", "_Position");
_Position = 0.0;

	}
	
	override public function init()
	{
		            /* "\"Top Row\", \"Bottom Row\", and \"Actor Type to Spawn\" are attributes defined in the scene editor." */
        _TileXPosition = asNumber(0);
propertyChanged("_TileXPosition", _TileXPosition);
        runPeriodically(1000 * 0.05, function(timeTask:TimedTask):Void {
                    _TileXPosition = asNumber(0);
propertyChanged("_TileXPosition", _TileXPosition);
                    /* "The following loop replaces any pieces that are matched and removed." */
                    for(index0 in 0...Std.int(asNumber(getSceneWidth()/getTileWidth())))
{
                        if((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_TileXPosition + (_BottomRow * getSceneWidth()/getTileWidth()))])), Actor).getType() == _ActorTypetoSpawn))
{
                            /* "If this column has moving game pieces..." */
                            if((cast((sayToScene("Scene Functions", "_customBlock_getTheActor", [(_TileXPosition + (_TopRow * asNumber(getSceneWidth()/getTileWidth())))])), Actor) == cast((sayToScene("Scene Functions", "_customBlock_getNullActor")), Actor)))
{
                                /* "If this column is empty on the top..." */
                                createRecycledActor(_ActorTypetoSpawn, (_TileXPosition * getTileWidth()), (_TopRow * getTileHeight()), Script.FRONT);
}

}

                        _TileXPosition = asNumber((_TileXPosition + 1));
propertyChanged("_TileXPosition", _TileXPosition);
}

}, null);

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}