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



class Design_262_262_PauseOnLosingFocus extends SceneScript
{          	
	
public var _PauseControl:String;

public var _DimScreen:Bool;

public var _DimmingOpacity:Float;

public var _DimmingColor:Int;

public var _FocusLost:Bool;

public var _PausedText:String;

public var _Font:Font;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Pause Control", "_PauseControl");
nameMap.set("Dim Screen", "_DimScreen");
_DimScreen = true;
nameMap.set("Dimming Opacity", "_DimmingOpacity");
_DimmingOpacity = 50.0;
nameMap.set("Dimming Color", "_DimmingColor");
_DimmingColor = Utils.getColorRGB(0,0,0);
nameMap.set("Focus Lost", "_FocusLost");
_FocusLost = false;
nameMap.set("Paused Text", "_PausedText");
_PausedText = "Paused";
nameMap.set("Font", "_Font");

	}
	
	override public function init()
	{
		    addFocusChangeListener(function(lost:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && lost){
        _FocusLost = true;
propertyChanged("_FocusLost", _FocusLost);
        scene.pause();
}
});
    addMouseReleasedListener(function(list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((scene.isPaused() && _FocusLost))
{
            scene.unpause();
}

        _FocusLost = false;
propertyChanged("_FocusLost", _FocusLost);
}
});
    addKeyStateListener(_PauseControl, function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && released){
        if(!(scene.isPaused()))
{
            scene.unpause();
}

        else
{
            scene.pause();
}

}
});
    addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((scene.isPaused() && _FocusLost))
{
            if(_DimScreen)
{
                g.fillColor = _DimmingColor;
                g.alpha = (_DimmingOpacity/100);
                g.fillRect(0, 0, getScreenWidth(), getScreenHeight());
}

            if((("" + _PausedText).length > 0))
{
                g.setFont(_Font);
                g.drawString("" + _PausedText, ((getScreenWidth() - g.font.font.getTextWidth(_PausedText)/Engine.SCALE) / 2), ((getScreenHeight() - g.font.getHeight()/Engine.SCALE) / 2));
}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}