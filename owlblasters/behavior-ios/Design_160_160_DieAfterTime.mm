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



@interface Design_160_160_DieAfterTime : ActorScript 
{
	@public
		NSString* tempHolder;
		
float time;

BOOL fadeOut;

float fadeDuration;

}
@end

@implementation Design_160_160_DieAfterTime

-(void)load
{
	            if(fadeOut)
{
            [mActor fadeTo:0 time:fadeDuration transition:SP_TRANSITION_LINEAR];
}

        [self doLater:1000 * time task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_160_160_DieAfterTime* self = (Design_160_160_DieAfterTime*) theScript;
                    [mActor die];
}]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end