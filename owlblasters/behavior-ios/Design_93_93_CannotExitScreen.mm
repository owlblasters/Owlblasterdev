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



@interface Design_93_93_CannotExitScreen : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_93_93_CannotExitScreen

-(void)load
{
	            [mActor makeAlwaysSimulate];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_93_93_CannotExitScreen* self = (Design_93_93_CannotExitScreen*) theScript;
        if(([mActor getYOnScreen] < 0))
{
            [mActor setYPosition:[self getScreenY]];
            [mActor setYVelocity:0];
}

        if((([mActor getYOnScreen] + [mActor getHeight]) > [self getScreenHeight]))
{
            [mActor setYPosition:([self getScreenY] + ([self getScreenHeight] - [mActor getHeight]))];
            [mActor setYVelocity:0];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end