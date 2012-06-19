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



@interface Design_42_42_2WayHorizontalMovement : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _RightControl;

NSString* _LeftControl;

BOOL _UseControls;

BOOL _PreventVerticalMovement;

float _MoveX;

NSString* _LeftAnimation;

NSString* _RightAnimationIdle;

float _StartY;

float _Speed;

NSString* _LeftAnimationIdle;

BOOL _StopTurning;

NSString* _RightAnimation;

BOOL _UseAnimations;

}
@end

@implementation Design_42_42_2WayHorizontalMovement

-(void)load
{
	            _StartY = [mActor getY];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_42_42_2WayHorizontalMovement* self = (Design_42_42_2WayHorizontalMovement*) theScript;
         
}];

} 

    -(void)MoveLeft
{
        _MoveX = -1;
}

    -(void)MoveRight
{
        _MoveX = 1;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end