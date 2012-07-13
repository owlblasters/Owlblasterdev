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



@interface ActorEvents_178 : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation ActorEvents_178

-(void)load
{
	    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
ActorEvents_178* self = (ActorEvents_178*) theScript;
        [mActor die];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end