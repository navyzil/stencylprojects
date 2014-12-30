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



class Design_59_59_LivesHUD extends SceneScript
{          	
	
public var _LivesActorType:ActorType;

public var _RemainingLives:Float;

public var _LivesActor:Actor;

public var _Player:Actor;

public var _PlayerType:ActorType;

public var _LivesDisplayType:String;

public var _DisplayOrientation:String;

public var _Spacing:Float;

public var _NumberFont:Font;

public var _ImageXOffset:Float;

public var _ImageYOffset:Float;

public var _NumberXOffset:Float;

public var _NumberYOffset:Float;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Lives Actor Type", "_LivesActorType");
nameMap.set("Remaining Lives", "_RemainingLives");
_RemainingLives = 0.0;
nameMap.set("Lives Actor", "_LivesActor");
nameMap.set("Player", "_Player");
nameMap.set("Player Type", "_PlayerType");
nameMap.set("Lives Display Type", "_LivesDisplayType");
_LivesDisplayType = "";
nameMap.set("Display Orientation", "_DisplayOrientation");
_DisplayOrientation = "";
nameMap.set("Spacing", "_Spacing");
_Spacing = 0.0;
nameMap.set("Number Font", "_NumberFont");
nameMap.set("Image X Offset", "_ImageXOffset");
_ImageXOffset = 0.0;
nameMap.set("Image Y Offset", "_ImageYOffset");
_ImageYOffset = 0.0;
nameMap.set("Number X Offset", "_NumberXOffset");
_NumberXOffset = 0.0;
nameMap.set("Number Y Offset", "_NumberYOffset");
_NumberYOffset = 0.0;

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */
        runLater(1000 * 0.1, function(timeTask:TimedTask):Void {
                    for(actorOfType in getActorsOfType(_PlayerType))
{
if(actorOfType != null && !actorOfType.dead && !actorOfType.recycled){
                        _Player = actorOfType;
propertyChanged("_Player", _Player);
}
}

                    if((hasValue(_Player) != false))
{
                        _RemainingLives = asNumber(cast((_Player.say("Lives Manager", "_customBlock_GetRemainingLives")), Float));
propertyChanged("_RemainingLives", _RemainingLives);
                        if((_RemainingLives > 0))
{
                            if(((_LivesDisplayType == "Image") || (_LivesDisplayType == "Both")))
{
                                createRecycledActor(_LivesActorType, _ImageXOffset, _ImageYOffset, Script.FRONT);
                                _LivesActor = getLastCreatedActor();
propertyChanged("_LivesActor", _LivesActor);
                                _LivesActor.anchorToScreen();
}

}

}

}, null);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((hasValue(_LivesActor) != false))
{
            if((_RemainingLives <= 0))
{
                _LivesActor.disableActorDrawing();
}

            else
{
                _LivesActor.enableActorDrawing();
}

}

}
});
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((hasValue(_LivesActor) != false))
{
            g.moveTo(_LivesActor.getScreenX(), _LivesActor.getScreenY());
            for(index0 in 0...Std.int((_RemainingLives - 1)))
{
                if((_DisplayOrientation == "Horizontal"))
{
                    g.translate(((_LivesActor.getWidth()) + _Spacing), 0);
}

                else
{
                    g.translate(0, ((_LivesActor.getHeight()) + _Spacing));
}

                _LivesActor.drawImage(g);
}

}

        if(((_LivesDisplayType == "Number") || (_LivesDisplayType == "Both")))
{
            if((hasValue(_NumberFont) != false))
{
                g.setFont(_NumberFont);
}

            g.drawString("" + _RemainingLives, _NumberXOffset, _NumberYOffset);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}