package scripts;

import com.stencyl.behavior.Script;
import scripts.Design_169_169_AnimationManager;
import scripts.Design_175_175_CameraFollowPlayer;
import scripts.Design_202_202_DieinPit;
import scripts.Design_163_163_Jumping;
import scripts.Design_110_110_Running;
import scripts.Design_108_108_Slowdown;
import scripts.Design_107_107_OnGround;
import scripts.Design_220_220_VirtualButton;
import scripts.ActorEvents_475;
import scripts.ActorEvents_477;
import scripts.ActorEvents_479;
import scripts.Design_115_115_AirJumping;
import scripts.Design_114_114_Falling;
import scripts.SceneEvents_8;
import scripts.ActorEvents_432;
import scripts.ActorEvents_473;
import scripts.Design_112_112_Ducking;
import scripts.Design_178_178_Walking;
import scripts.Design_179_179_WallJumping;
import scripts.Design_123_123_AlwaysSimulate;
import scripts.Design_180_180_WallSliding;
import scripts.Design_181_181_GroundPound;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}