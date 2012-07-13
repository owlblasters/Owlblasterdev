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



@interface Design_20_20_UpdatePlayerPosition : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_20_20_UpdatePlayerPosition

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_20_20_UpdatePlayerPosition* self = (Design_20_20_UpdatePlayerPosition*) theScript;
        [self setGameAttribute:@"Credits" value:[NSNumber numberWithFloat:[mActor getY]]];
        [self setGameAttribute:@"GunListLoc" value:[NSNumber numberWithFloat:[mActor getX]]];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end