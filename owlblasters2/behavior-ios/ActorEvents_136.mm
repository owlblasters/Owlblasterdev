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



@interface ActorEvents_136 : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation ActorEvents_136

-(void)load
{
	            [mActor setYVelocity:-20];
    [self addActorPositionListener:mActor func:^(Actor* a, BOOL enteredScreen, BOOL exitedScreen, BOOL enteredScene, BOOL exitedScene, NSMutableArray* list, Script* theScript){
ActorEvents_136* self = (ActorEvents_136*) theScript;
if(exitedScreen){
        [self recycleActor:mActor];
}
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end