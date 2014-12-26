package scripts;

import com.stencyl.behavior.Script;
import scripts.Design_17_17_NewBlockBehavior;
import scripts.ActorEvents_19;
import scripts.Design_18_18_SceneFunctions;
import scripts.ActorEvents_30;
import scripts.ActorEvents_28;
import scripts.Design_6_6_SpawnBlocks;
import scripts.SceneEvents_1;
import scripts.ActorEvents_11;
import scripts.Design_12_12_ScoreBGDraw;
import scripts.Design_15_15_TilePlaceholderBehavior;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}