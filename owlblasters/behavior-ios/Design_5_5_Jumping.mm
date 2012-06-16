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



@interface Design_5_5_Jumping : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _KeyReleased;

BOOL _CanJump;

NSString* _JumpKey;

float _MaxJumpTime;

NSString* _JumpRightAnimation;

NSString* _JumpLeftAnimation;

BOOL _PreventJumping;

float _ElapsedJumpTime;

float _oldY;

float _CurrentJumpTime;

SPSound* _JumpSound;

float _JumpingSlowdown;

float _JumpForce;

}
@end

@implementation Design_5_5_Jumping

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_5_5_Jumping* self = (Design_5_5_Jumping*) theScript;
        /* @"Set the animations based on which weapon you're holding." */
        if([self asBoolean:[mActor getActorValue:@"Is Swimming?"]])
{
            [mActor setActorValue:@"Is Jumping?" value:[NSNumber numberWithBool:FALSE]];
            _KeyReleased = FALSE;
            return;
}

        /* @"If we're on the ground, we're not jumping" */
        if([self asBoolean:[mActor getActorValue:@"On Ground?"]])
{
            [mActor setActorValue:@"Is Jumping?" value:[NSNumber numberWithBool:FALSE]];
            if(_KeyReleased)
{
                _CanJump = TRUE;
}

}

        /* @"Check for the jump key press, but also allow a bit of leeway for smoother jumping" */
        if([self isKeyPressed:_JumpKey])
{
            if(!([self asBoolean:[mActor getActorValue:@"On Ground?"]]))
{
                [self doLater:1000 * 0.15 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_5_5_Jumping* self = (Design_5_5_Jumping*) theScript;
                            if([Actor isAlive:mActor])
{
                                if(!([self asBoolean:[mActor getActorValue:@"On Ground?"]]))
{
                                    _KeyReleased = FALSE;
}

}

}]];
}

}

        /* @"Detect the release of the jump key" */
        if((!(_KeyReleased) && !([self isKeyDown:_JumpKey])))
{
            _KeyReleased = TRUE;
            /* @"If we're still in the middle of jumping, slow down our upward ascent" */
            if(([self asBoolean:[mActor getActorValue:@"Is Jumping?"]] && ([mActor getY] < _oldY)))
{
                [mActor setYVelocity:([mActor getYVelocity] * _JumpingSlowdown)];
}

}

        /* @"Detect the jump key press, and initiate the jump" */
        if(([self isKeyDown:_JumpKey] && (_CanJump && (_KeyReleased && [self asBoolean:[mActor getActorValue:@"On Ground?"]]))))
{
            [self playSound:[self getSound:261]];
            _ElapsedJumpTime = 0;
            [mActor setYVelocity:-(_JumpForce)];
            _CanJump = FALSE;
            _KeyReleased = FALSE;
            /* @"Add a small delay before setting the jumping flag, since another collision can occur before the Actor" */
            /* @"gets off the ground, and this would just reset the flag to FALSE." */
            [self doLater:1000 * 0.075 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_5_5_Jumping* self = (Design_5_5_Jumping*) theScript;
                        if([Actor isAlive:mActor])
{
                            [mActor setActorValue:@"Is Jumping?" value:[NSNumber numberWithBool:TRUE]];
}

}]];
            return;
}

        /* @"If we are currently jumping, set the jumping animation" */
        if([self asBoolean:[mActor getActorValue:@"Is Jumping?"]])
{
            _ElapsedJumpTime += 1;
            if([self asBoolean:[mActor getActorValue:@"Facing Right?"]])
{
                if(([mActor getY] < _oldY))
{

}

}

            else
{
                if(([mActor getY] < _oldY))
{

}

}

            /* @"Check to see if the amount of time we've been jumping for has exceeded the max jumping time" */
            /* @"if not, keep setting the jump velocity" */
            if((_ElapsedJumpTime <= ((_MaxJumpTime * 1000) / (1000 * STEP_SIZE))))
{
                if(([self isKeyDown:_JumpKey] && (!(_KeyReleased) && ([mActor getY] < _oldY))))
{
                    [mActor setYVelocity:-(_JumpForce)];
}

}

}

        _oldY = [mActor getY];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end