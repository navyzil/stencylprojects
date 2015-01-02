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



class Design_61_61_DeathHandler extends ActorScript
{          	
	
public var _ListenLifeLostMessage:String;

public var _ListenDeathMessage:String;

public var _LifeLostAction:String;

public var _DeathAction:String;

public var _LifeLostScene:Scene;

public var _DeathScene:Scene;
    public function _customEvent_whenThisHears_ListenLifeLostMessage():Void
{
        if((_LifeLostAction == "Kill"))
{
            recycleActor(actor);
}

        else if((_LifeLostAction == "Recycle"))
{
            recycleActor(actor);
}

        else if((_LifeLostAction == "Switch"))
{
            switchScene(_LifeLostScene.getID(), createFadeOut((1)),createFadeIn((1)));
}

        else if((_LifeLostAction == "Reload"))
{
            reloadCurrentScene(createFadeOut((1)),createFadeIn((1)));
}

        else if((_LifeLostAction == "RespawnCP"))
{

}

        else if((_LifeLostAction == "ReloadCP"))
{

}

}

    public function _customEvent_whenThisHears_ListenDeathMessage():Void
{
        if((_DeathAction == "Kill"))
{
            recycleActor(actor);
}

        else if((_DeathAction == "Recycle"))
{
            recycleActor(actor);
}

        else if((_DeathAction == "Switch"))
{
            switchScene(_DeathScene.getID(), createFadeOut((1)),createFadeIn((1)));
}

        else if((_DeathAction == "Reload"))
{
            reloadCurrentScene(createFadeOut((1)),createFadeIn((1)));
}

}


 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Listen Life Lost Message", "_ListenLifeLostMessage");
_ListenLifeLostMessage = "LifeLost";
nameMap.set("Listen Death Message", "_ListenDeathMessage");
_ListenDeathMessage = "Death";
nameMap.set("Life Lost Action", "_LifeLostAction");
_LifeLostAction = "";
nameMap.set("Death Action", "_DeathAction");
_DeathAction = "";
nameMap.set("Life Lost Scene", "_LifeLostScene");
nameMap.set("Death Scene", "_DeathScene");
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		
	}	      	
	
	override public function forwardMessage(msg:String)
	{
		if(msg == ("_customEvent_" + _ListenLifeLostMessage))
{
_customEvent_whenThisHears_ListenLifeLostMessage();
return;
}
if(msg == ("_customEvent_" + _ListenDeathMessage))
{
_customEvent_whenThisHears_ListenDeathMessage();
return;
}

	}
}