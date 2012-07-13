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



@interface Design_27_27_JetpackFollowPlayer : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _IdleRightAnimation;

NSString* _IdleLeftAnimation;

NSString* _ActiveRightAnimation;

NSString* _ActiveLeftAnimation;

NSString* _SputterLeftAnimation;

NSString* _SputterRightAnimation;

ActorType* _PlayerActorType;

Actor* _PlayerActor;

float _LeftXOffset;

float _LeftYOffset;

float _RightXOffset;

float _RightYOffset;

BOOL _JetpackActive;

BOOL _SpawnedExternally;

BOOL _JetpackSputtering;

}
@end

@implementation Design_27_27_JetpackFollowPlayer

-(void)load
{
	            [mActor makeAlwaysSimulate];
        if(!(_SpawnedExternally))
{
            for(Actor* actorOfType in [self getActorsOfType:_PlayerActorType])
{
if(actorOfType != nil && !actorOfType.dead){
                _PlayerActor = actorOfType;
}
}

}

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_27_27_JetpackFollowPlayer* self = (Design_27_27_JetpackFollowPlayer*) theScript;
        if(((_PlayerActor != nil) && [Actor isAlive:_PlayerActor]))
{
            [self SyncWithPlayer];
}

        _JetpackActive = FALSE;
}];

} 

    -(void)SyncWithPlayer
{
        if([self asBoolean:[_PlayerActor getActorValue:@"Facing Right?"]])
{
            [mActor setXPosition:([_PlayerActor getX] + _RightXOffset)];
            [mActor setYPosition:([_PlayerActor getY] + _RightYOffset)];
            if(_JetpackSputtering)
{
                [mActor setAnimation:_SputterRightAnimation];
}

            else if(_JetpackActive)
{
                [mActor setAnimation:_ActiveRightAnimation];
}

            else
{
                [mActor setAnimation:_IdleRightAnimation];
}

}

        else
{
            [mActor setXPosition:([_PlayerActor getX] + _LeftXOffset)];
            [mActor setYPosition:([_PlayerActor getY] + _LeftYOffset)];
            if(_JetpackSputtering)
{
                [mActor setAnimation:_SputterLeftAnimation];
}

            else if(_JetpackActive)
{
                [mActor setAnimation:_ActiveLeftAnimation];
}

            else
{
                [mActor setAnimation:_IdleLeftAnimation];
}

}

        [mActor setXVelocity:[_PlayerActor getXVelocity]];
        [mActor setYVelocity:[_PlayerActor getYVelocity]];
}

    

/* Params are:__Self __Player */
- ( void) Sync:(NSArray*)args
{
Actor* __Self = mActor;
Actor* __Player = (Actor*) [args objectAtIndex:0];
        _PlayerActor = __Player;
}
    -(void)JetsActive
{
        _JetpackActive = TRUE;
        _JetpackSputtering = FALSE;
}

    -(void)JetsIdle
{
        _JetpackActive = FALSE;
        _JetpackSputtering = FALSE;
}

    -(void)JetsEmpty
{
        _JetpackActive = TRUE;
        _JetpackSputtering = TRUE;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end