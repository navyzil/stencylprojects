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



class Design_64_64_DisplayHealthBar extends ActorScript
{          	
	
public var _HealthBarOrientation:String;

public var _HealthBarWidth:Float;

public var _HealthBarHeight:Float;

public var _HealthBarXOffset:Float;

public var _HealthBarYOffset:Float;

public var _DrawingLocation:String;

public var _ColorOver75Percent:Int;

public var _ColorOver50Percent:Int;

public var _ColorOver25Percent:Int;

public var _ColorUnder25Percent:Int;

public var _PercentLeft:Float;

public var _HealthBarBackgroundColor:Int;

public var _HealthBarOutlineColor:Int;

public var _HealthBarOutlineSize:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Health Bar Orientation", "_HealthBarOrientation");
_HealthBarOrientation = "";
nameMap.set("Health Bar Width", "_HealthBarWidth");
_HealthBarWidth = 100.0;
nameMap.set("Health Bar Height", "_HealthBarHeight");
_HealthBarHeight = 5.0;
nameMap.set("Health Bar X Offset", "_HealthBarXOffset");
_HealthBarXOffset = 0.0;
nameMap.set("Health Bar Y Offset", "_HealthBarYOffset");
_HealthBarYOffset = 0.0;
nameMap.set("Drawing Location", "_DrawingLocation");
_DrawingLocation = "";
nameMap.set("Color Over 75 Percent", "_ColorOver75Percent");
_ColorOver75Percent = Utils.getColorRGB(0,255,0);
nameMap.set("Color Over 50 Percent", "_ColorOver50Percent");
_ColorOver50Percent = Utils.getColorRGB(0,255,255);
nameMap.set("Color Over 25 Percent", "_ColorOver25Percent");
_ColorOver25Percent = Utils.getColorRGB(255,102,0);
nameMap.set("Color Under 25 Percent", "_ColorUnder25Percent");
_ColorUnder25Percent = Utils.getColorRGB(255,0,0);
nameMap.set("Percent Left", "_PercentLeft");
_PercentLeft = 0.0;
nameMap.set("Health Bar Background Color", "_HealthBarBackgroundColor");
_HealthBarBackgroundColor = Utils.getColorRGB(0,0,0);
nameMap.set("Health Bar Outline Color", "_HealthBarOutlineColor");
_HealthBarOutlineColor = Utils.getColorRGB(255,255,255);
nameMap.set("Health Bar Outline Size", "_HealthBarOutlineSize");
_HealthBarOutlineSize = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    
/* ======================== When Creating ========================= */

    
/* ======================== When Updating ========================= */
addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        _PercentLeft = asNumber((cast((actor.say("Health Manager", "_customBlock_GetCurrentHealth")), Float) / cast((actor.say("Health Manager", "_customBlock_GetMaxHealth")), Float)));
propertyChanged("_PercentLeft", _PercentLeft);
}
});
    
/* ========================= When Drawing ========================= */
addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((_DrawingLocation == "Screen"))
{
            g.translateToScreen();
}

        /* "Draw the health bar background and outline" */
        if((_HealthBarOutlineSize > 0))
{
            g.fillColor = _HealthBarOutlineColor;
            g.fillRect((_HealthBarXOffset - _HealthBarOutlineSize), (_HealthBarYOffset - _HealthBarOutlineSize), (_HealthBarWidth + (_HealthBarOutlineSize * 2)), (_HealthBarHeight + (_HealthBarOutlineSize * 2)));
}

        g.fillColor = _HealthBarBackgroundColor;
        g.fillRect(_HealthBarXOffset, _HealthBarYOffset, _HealthBarWidth, _HealthBarHeight);
        if((_PercentLeft > 0.75))
{
            g.fillColor = _ColorOver75Percent;
}

        else if((_PercentLeft > 0.50))
{
            g.fillColor = _ColorOver50Percent;
}

        else if((_PercentLeft > 0.25))
{
            g.fillColor = _ColorOver25Percent;
}

        else
{
            g.fillColor = _ColorUnder25Percent;
}

        /* "Draw the current amount of health" */
        if((_HealthBarOrientation == "Horizontal"))
{
            g.fillRect((_HealthBarXOffset + 1), (_HealthBarYOffset + 1), (Math.round((_HealthBarWidth * _PercentLeft)) - 2), (_HealthBarHeight - 2));
}

        else
{
            g.fillRect((_HealthBarXOffset + 1), ((_HealthBarYOffset + Math.round((_HealthBarHeight * (1 - _PercentLeft)))) + 1), (_HealthBarWidth - 2), (Math.round((_HealthBarHeight * _PercentLeft)) - 2));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}