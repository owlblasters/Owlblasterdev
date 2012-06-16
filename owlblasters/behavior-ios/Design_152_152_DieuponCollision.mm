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



@interface Design_152_152_DieuponCollision : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_152_152_DieuponCollision

-(void)load
{
	    [self handlesCollisions];

    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_152_152_DieuponCollision* self = (Design_152_152_DieuponCollision*) theScript;
        [mActor die];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end