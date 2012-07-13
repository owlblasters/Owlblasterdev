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



@interface ActorEvents_110 : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation ActorEvents_110

-(void)load
{
	            [mActor setYVelocity:-20];
    [self doLater:1000 * 4 task:[self createRunnable:^(Runnable* parent, Script* theScript){
ActorEvents_110* self = (ActorEvents_110*) theScript;
        [self recycleActor:mActor];
}]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end