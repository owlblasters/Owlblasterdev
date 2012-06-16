#import <Box2D/Box2D.h>
#import <AudioToolbox/AudioServices.h>
#import <Foundation/Foundation.h>
#import "ActorScript.h"

#import "Script.h"

#import "Actor.h"
#import "ActorType.h"
#import "Assets.h"
#import "Behavior.h"
#import "Collision.h"
#import "CollisionPoint.h"
#import "Game.h"
#import "GameModel.h"
#import "GroupDef.h"
#import "FadeInTransition.h"
#import "FadeOutTransition.h"
#import "Region.h"
#import "Runnable.h"
#import "Scene.h"
#import "SHThumbstick.h"
#import "Sparrow.h"
#import "Transition.h"



@interface Design_9_9_ReloadSceneonDeath : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _Delay;

float _FadeOutTime;

float _FadeInTime;

}
@end

@implementation Design_9_9_ReloadSceneonDeath

-(void)load
{
	    

} 

    -(void)healthDepleted
{
        [self doLater:1000 * _Delay task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_9_9_ReloadSceneonDeath* self = (Design_9_9_ReloadSceneonDeath*) theScript;
                    [self reloadCurrentScene:[self createFadeOut:((1000*_FadeOutTime)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}]];
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end