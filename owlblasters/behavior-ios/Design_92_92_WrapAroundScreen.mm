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



@interface Design_92_92_WrapAroundScreen : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _WrapX;

float _WrapY;

}
@end

@implementation Design_92_92_WrapAroundScreen

-(void)load
{
	            [mActor makeAlwaysSimulate];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_92_92_WrapAroundScreen* self = (Design_92_92_WrapAroundScreen*) theScript;
        if((([mActor getXOnScreen] + [mActor getWidth]) < _WrapX))
{
            [mActor setXPosition:(([self getScreenX] + [self getScreenWidth]) - _WrapX)];
}

        if(([mActor getXOnScreen] > ([self getScreenWidth] - _WrapX)))
{
            [mActor setXPosition:(([self getScreenX] - [mActor getWidth]) + _WrapX)];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end