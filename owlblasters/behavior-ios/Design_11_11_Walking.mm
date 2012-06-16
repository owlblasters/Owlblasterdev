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



@interface Design_11_11_Walking : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _MoveRightKey;

NSString* _MoveLeftKey;

float _Acceleration;

float _MaxWalkingSpeed;

BOOL _LimitSpeed;

NSString* _WalkRightAnimation;

NSString* _WalkLeftAnimation;

NSString* _IdleRightAnimation;

NSString* _IdleLeftAnimation;

BOOL _PreventWalking;

BOOL _InitiallyFacingRight;

}
@end

@implementation Design_11_11_Walking

-(void)load
{
	            if(_InitiallyFacingRight)
{
            [mActor setActorValue:@"Facing Right?" value:[NSNumber numberWithBool:TRUE]];
}

        else
{
            [mActor setActorValue:@"Facing Right?" value:[NSNumber numberWithBool:FALSE]];
}

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_11_11_Walking* self = (Design_11_11_Walking*) theScript;
        /* @"Set the animations based on which weapon you're holding." */
        if(([self asBoolean:[mActor getActorValue:@"Is Ducking?"]] || [self asBoolean:[mActor getActorValue:@"Is Slope Sliding?"]]))
{
            return;
}

        if(_PreventWalking)
{
            return;
}

        if(([self isKeyDown:_MoveRightKey] && !([self isKeyDown:_MoveLeftKey])))
{
            [mActor shout:@"Trace"];
            [mActor setActorValue:@"Facing Right?" value:[NSNumber numberWithBool:TRUE]];
            if(!([self asBoolean:[mActor getActorValue:@"Is Running?"]]))
{

}

            if((BOOL)[([mActor sayToBehavior:@"Walking" msg:@"AtMaxWalkingSpeed" withArgs:nil]) boolValue])
{
                return;
}

            if(([mActor getXVelocity] < 0))
{
                [mActor push:1 dirY:0 withForce:(_Acceleration * 3)];
}

            [mActor push:1 dirY:0 withForce:_Acceleration];
}

        if(([self isKeyDown:_MoveLeftKey] && !([self isKeyDown:_MoveRightKey])))
{
            [mActor shout:@"Trace"];
            [mActor setActorValue:@"Facing Right?" value:[NSNumber numberWithBool:FALSE]];
            if(!([self asBoolean:[mActor getActorValue:@"Is Running?"]]))
{

}

            if((BOOL)[([mActor sayToBehavior:@"Walking" msg:@"AtMaxWalkingSpeed" withArgs:nil]) boolValue])
{
                return;
}

            if(([mActor getXVelocity] > 0))
{
                [mActor push:-1 dirY:0 withForce:(_Acceleration * 3)];
}

            [mActor push:-1 dirY:0 withForce:_Acceleration];
}

        if((!([self isKeyDown:_MoveRightKey]) && !([self isKeyDown:_MoveLeftKey])))
{
            [mActor shout:@"StopTrace"];
            if([self asBoolean:[mActor getActorValue:@"Facing Right?"]])
{

}

            else
{

}

}

}];

} 

    

/* Params are:__Self */
- ( NSNumber*) AtMaxWalkingSpeed:(NSArray*)args
{
Actor* __Self = mActor;
        if(([self asBoolean:[mActor getActorValue:@"Facing Right?"]] && ([mActor getXVelocity] >= _MaxWalkingSpeed)))
{
            if(_LimitSpeed)
{
                [mActor setXVelocity:_MaxWalkingSpeed];
}

            return [NSNumber numberWithBool:TRUE];
}

        if((!([self asBoolean:[mActor getActorValue:@"Facing Right?"]]) && ([mActor getXVelocity] <= -(_MaxWalkingSpeed))))
{
            if(_LimitSpeed)
{
                [mActor setXVelocity:-(_MaxWalkingSpeed)];
}

            return [NSNumber numberWithBool:TRUE];
}

        return [NSNumber numberWithBool:FALSE];
}
    

/* Params are:__Self __Accel */
- ( void) WalkAccel:(NSArray*)args
{
Actor* __Self = mActor;
float __Accel = (float) [[args objectAtIndex:0] floatValue];
        _Acceleration = __Accel;
}
    

/* Params are:__Self */
- ( NSNumber*) GetWalkAccel:(NSArray*)args
{
Actor* __Self = mActor;
        return [NSNumber numberWithFloat:_Acceleration];
}
    

/* Params are:__Self __MaxSpeed */
- ( void) MaxWalkSpeed:(NSArray*)args
{
Actor* __Self = mActor;
float __MaxSpeed = (float) [[args objectAtIndex:0] floatValue];
        _MaxWalkingSpeed = __MaxSpeed;
}
    

/* Params are:__Self */
- ( NSNumber*) GetMaxWalkSpeed:(NSArray*)args
{
Actor* __Self = mActor;
        return [NSNumber numberWithFloat:_MaxWalkingSpeed];
}
    

/* Params are:__Self __Prevent */
- ( void) PreventWalk:(NSArray*)args
{
Actor* __Self = mActor;
BOOL __Prevent = (BOOL) [[args objectAtIndex:0] boolValue];
        _PreventWalking = __Prevent;
}
    

/* Params are:__Self __Limit */
- ( void) LimitSpeed:(NSArray*)args
{
Actor* __Self = mActor;
BOOL __Limit = (BOOL) [[args objectAtIndex:0] boolValue];
        _LimitSpeed = __Limit;
}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end