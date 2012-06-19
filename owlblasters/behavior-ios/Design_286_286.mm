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



@interface Design_286_286 : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_286_286

-(void)load
{
	    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_286_286* self = (Design_286_286*) theScript;
        [mActor die];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end