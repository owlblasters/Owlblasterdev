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



@interface Design_94_94_CannotExitScene : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _Bottom;

}
@end

@implementation Design_94_94_CannotExitScene

-(void)load
{
	            [mActor makeAlwaysSimulate];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_94_94_CannotExitScene* self = (Design_94_94_CannotExitScene*) theScript;
        if(([mActor getX] < 0))
{
            [mActor setXPosition:0];
            [mActor setXVelocity:0];
}

        if(([mActor getY] < 0))
{
            [mActor setYPosition:0];
            [mActor setYVelocity:0];
}

        if((([mActor getX] + [mActor getWidth]) > [self getSceneWidth]))
{
            [mActor setXPosition:([self getSceneWidth] - [mActor getWidth])];
            [mActor setXVelocity:0];
}

        if((([mActor getY] + [mActor getHeight]) > [self getSceneHeight]))
{
            [mActor setYPosition:([self getSceneHeight] - [mActor getHeight])];
            [mActor setYVelocity:0];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end