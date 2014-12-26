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



class Design_12_12_ScoreBGDraw extends ActorScript
{          	
	
 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            setGameAttribute("Score", 0);
    addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        g.setFont(getFont(6));
        /* "These blocks draw and center the label and score on this actor." */
        g.drawString("" + "Score", (actor.getWidth()/2 - (g.font.font.getTextWidth("Score")/Engine.SCALE / 2)), 4);
        g.drawString("" + ("" + getGameAttribute("Score")), (actor.getWidth()/2 - (g.font.font.getTextWidth(("" + getGameAttribute("Score")))/Engine.SCALE / 2)), 45);
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}