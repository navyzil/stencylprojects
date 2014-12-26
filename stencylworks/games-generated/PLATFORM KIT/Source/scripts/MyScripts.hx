package scripts;

import com.stencyl.behavior.Script;
import scripts.ActorEvents_552;
import scripts.ActorEvents_548;
import scripts.SceneEvents_13;
import scripts.Design_278_278_DieOnCollisionWithActorType;
import scripts.Design_277_277_DieOnCollisionWithGroup;
import scripts.ActorEvents_554;
import scripts.Design_258_258_WallSliding;
import scripts.ActorEvents_475;
import scripts.Design_259_259_GroundPound;
import scripts.ActorEvents_477;
import scripts.Design_256_256_WallJumping;
import scripts.Design_257_257_AlwaysSimulate;
import scripts.Design_262_262_PauseOnLosingFocus;
import scripts.SceneEvents_8;
import scripts.Design_263_263_SwitchSceneonEnterRegion;
import scripts.Design_260_260_CannotExitScene;
import scripts.Design_262_262_RADIOV1;
import scripts.ActorEvents_473;
import scripts.SceneEvents_12;
import scripts.ActorEvents_545;
import scripts.Design_271_271_BackandForthHorizontally;
import scripts.Design_254_254_Ducking;
import scripts.Design_255_255_Walking;
import scripts.Design_252_252_AirJumping;
import scripts.Design_253_253_Falling;
import scripts.Design_250_250_OnGround;
import scripts.Design_251_251_VirtualButton;
import scripts.Design_248_248_Running;
import scripts.Design_249_249_Slowdown;
import scripts.Design_246_246_DieinPit;
import scripts.Design_247_247_Jumping;
import scripts.Design_244_244_AnimationManager;
import scripts.Design_245_245_CameraFollowPlayer;
import scripts.ActorEvents_522;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}