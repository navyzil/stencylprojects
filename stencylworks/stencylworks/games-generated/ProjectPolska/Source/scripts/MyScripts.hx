package scripts;

import com.stencyl.behavior.Script;
import scripts.Design_0_0_StomponEnemies;
import scripts.Design_1_1_Stompable;
import scripts.Design_3_3_DieinPitandReload;
import scripts.ActorEvents_0;
import scripts.ActorEvents_2;
import scripts.SceneEvents_0;
import scripts.ActorEvents_15;
import scripts.Design_9_9_SmoothCamera;
import scripts.Design_10_10_DieOnCollisionWithActorType;
import scripts.Design_11_11_FollowTarget;
import scripts.Design_12_12_FaceTarget;
import scripts.Design_13_13_EnemyWalkingAI;
import scripts.Design_14_14_ReloadSceneOnDeath;
import scripts.Design_15_15_HealthManager;
import scripts.Design_17_17_Walking;
import scripts.Design_16_16_drawlives;
import scripts.Design_19_19_Jump;
import scripts.Design_18_18_Jumping;
import scripts.Design_21_21_SwitchSceneonEnterRegion;
import scripts.Design_20_20_JumpandRunMovement;
import scripts.Design_23_23_MoveToNextScene;
import scripts.Design_22_22_SwitchScenesWhenActorsareGone;
import scripts.Design_25_25_AlwaysSimulate;
import scripts.Design_24_24_RandomWalkingAI;
import scripts.ActorEvents_25;
import scripts.Design_26_26_enemyShoot;
import scripts.Design_29_29_DieOnCollision;
import scripts.Design_28_28_FiringLoop;
import scripts.Design_31_31_DieOnLeavingScreen;
import scripts.Design_30_30_FireBullet;
import scripts.Design_34_34_FollowPath;
import scripts.Design_35_35_BackandForthHorizontally;
import scripts.ActorEvents_27;
import scripts.ActorEvents_29;
import scripts.Design_40_40_EnemyPatrol;
import scripts.Design_37_37_PatrolRightLeft;
import scripts.Design_42_42_WaveMotion;
import scripts.Design_43_43_2WayVerticalMovement;
import scripts.Design_40_40_DetectPlayer;
import scripts.Design_41_41;
import scripts.Design_46_46_ShowHealthBar;
import scripts.Design_47_47_InflictsDamage;
import scripts.Design_44_44_EnemyJump;
import scripts.Design_45_45_BounceWithFullSpeed;
import scripts.Design_50_50_SpawnActoruponDeath;
import scripts.Design_49_49_FlickerwhenHit;
import scripts.Design_48_48_Health;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}