package scripts;

import com.stencyl.behavior.Script;
import scripts.ActorEvents_0;
import scripts.Design_1_1_2WayHorizontalMovement;
import scripts.SceneEvents_0;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}