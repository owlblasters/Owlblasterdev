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



@interface Design_95_95_WrapAroundScene : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _WrapX;

float _WrapY;

}
@end

@implementation Design_95_95_WrapAroundScene

-(void)load
{
	            [mActor makeAlwaysSimulate];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_95_95_WrapAroundScene* self = (Design_95_95_WrapAroundScene*) theScript;
        if((([mActor getX] + [mActor getWidth]) < _WrapX))
{
            [mActor setXPosition:([self getSceneWidth] - _WrapX)];
}

        if((([mActor getY] + [mActor getHeight]) < _WrapY))
{
            [mActor setYPosition:([self getSceneHeight] - _WrapY)];
}

        if(([mActor getX] > ([self getSceneWidth] - _WrapX)))
{
            [mActor setXPosition:(_WrapX - [mActor getWidth])];
}

        if(([mActor getY] > ([self getSceneHeight] - _WrapY)))
{
            [mActor setYPosition:(_WrapY - [mActor getHeight])];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end