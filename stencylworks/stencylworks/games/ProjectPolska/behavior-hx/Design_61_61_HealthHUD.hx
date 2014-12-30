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



class Design_61_61_HealthHUD extends SceneScript
{          	
	
public var _Player:Actor;

public var _PlayerType:ActorType;

public var _HealthDisplayType:String;

public var _HealthFont:Font;

public var _HealthOrientation:String;

public var _HealthDrawingLocation:String;

public var _HealthBarOutlineColor:Int;

public var _HealthBarOutlineSize:Float;

public var _Over75Percent:Int;

public var _HealthBarBackgroundColor:Int;

public var _Over25Percent:Int;

public var _Over50Percent:Int;

public var _PercentLeft:Float;

public var _Under25Percent:Int;

public var _HealthBarHeight:Float;

public var _HealthBarWidth:Float;

public var _HealthNumberYOffset:Float;

public var _HealthNumberXOffset:Float;

public var _HealthBarYOffset:Float;

public var _HealthBarXOffset:Float;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Player", "_Player");
nameMap.set("Player Type", "_PlayerType");
nameMap.set("Health Display Type", "_HealthDisplayType");
_HealthDisplayType = "";
nameMap.set("Health Font", "_HealthFont");
nameMap.set("Health Orientation", "_HealthOrientation");
_HealthOrientation = "";
nameMap.set("Health Drawing Location", "_HealthDrawingLocation");
_HealthDrawingLocation = "";
nameMap.set("Health Bar Outline Color", "_HealthBarOutlineColor");
_HealthBarOutlineColor = Utils.getColorRGB(255,255,255);
nameMap.set("Health Bar Outline Size", "_HealthBarOutlineSize");
_HealthBarOutlineSize = 0.0;
nameMap.set("Over 75 Percent", "_Over75Percent");
_Over75Percent = Utils.getColorRGB(0,255,0);
nameMap.set("Health Bar Background Color", "_HealthBarBackgroundColor");
_HealthBarBackgroundColor = Utils.getColorRGB(0,0,0);
nameMap.set("Over 25 Percent", "_Over25Percent");
_Over25Percent = Utils.getColorRGB(255,102,0);
nameMap.set("Over 50 Percent", "_Over50Percent");
_Over50Percent = Utils.getColorRGB(0,255,255);
nameMap.set("Percent Left", "_PercentLeft");
_PercentLeft = 0.0;
nameMap.set("Under 25 Percent", "_Under25Percent");
_Under25Percent = Utils.getColorRGB(255,0,0);
nameMap.set("Health Bar Height", "_HealthBarHeight");
_HealthBarHeight = 0.0;
nameMap.set("Health Bar Width", "_HealthBarWidth");
_HealthBarWidth = 0.0;
nameMap.set("Health Number Y Offset", "_HealthNumberYOffset");
_HealthNumberYOffset = 0.0;
nameMap.set("Health Number X Offset", "_HealthNumberXOffset");
_HealthNumberXOffset = 0.0;
nameMap.set("Health Bar Y Offset", "_HealthBarYOffset");
_HealthBarYOffset = 0.0;
nameMap.set("Health Bar X Offset", "_HealthBarXOffset");
_HealthBarXOffset = 0.0;

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

}, null);
    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(((hasValue(_Player) != false) && _Player.isAlive()))
{
            _PercentLeft = asNumber((cast((_Player.say("Health Manager", "_customBlock_GetCurrentHealth")), Float) / cast((_Player.say("Health Manager", "_customBlock_GetMaxHealth")), Float)));
propertyChanged("_PercentLeft", _PercentLeft);
}

}
});
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(((hasValue(_Player) == false) || !(_Player.isAlive())))
{
            return;
}

        if((_HealthDrawingLocation == "Actor"))
{
            g.translateToActor(_Player);
}

        if(((_HealthDisplayType == "Number") || (_HealthDisplayType == "Both")))
{
            if((hasValue(_HealthFont) != false))
{
                g.setFont(_HealthFont);
}

            g.drawString("" + cast((_Player.say("Health Manager", "_customBlock_GetCurrentHealth")), Float), _HealthNumberXOffset, _HealthNumberYOffset);
}

        /* "Draw the health bar background and outline" */
        if(((_HealthDisplayType == "Bar") || (_HealthDisplayType == "Both")))
{
            if((_HealthBarOutlineSize > 0))
{
                g.fillColor = _HealthBarOutlineColor;
                g.fillRect((_HealthBarXOffset - _HealthBarOutlineSize), (_HealthBarYOffset - _HealthBarOutlineSize), (_HealthBarWidth + (_HealthBarOutlineSize * 2)), (_HealthBarHeight + (_HealthBarOutlineSize * 2)));
}

            g.fillColor = _HealthBarBackgroundColor;
            g.fillRect(_HealthBarXOffset, _HealthBarYOffset, _HealthBarWidth, _HealthBarHeight);
            if((_PercentLeft > 0.75))
{
                g.fillColor = _Over75Percent;
}

            else if((_PercentLeft > 0.50))
{
                g.fillColor = _Over50Percent;
}

            else if((_PercentLeft > 0.25))
{
                g.fillColor = _Over25Percent;
}

            else
{
                g.fillColor = _Under25Percent;
}

            /* "Draw the current amount of health" */
            if((_HealthOrientation == "Horizontal"))
{
                g.fillRect((_HealthBarXOffset + 1), (_HealthBarYOffset + 1), (Math.round((_HealthBarWidth * _PercentLeft)) - 2), (_HealthBarHeight - 2));
}

            else
{
                g.fillRect((_HealthBarXOffset + 1), ((_HealthBarYOffset + Math.round((_HealthBarHeight * (1 - _PercentLeft)))) + 1), (_HealthBarWidth - 2), (Math.round((_HealthBarHeight * _PercentLeft)) - 2));
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}