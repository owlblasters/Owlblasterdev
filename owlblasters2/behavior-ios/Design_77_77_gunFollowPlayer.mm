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



@interface Design_77_77_gunFollowPlayer : ActorScript 
{
	@public
		NSString* tempHolder;
		
Actor* _PlayerActor;

ActorType* _playerActorType;

float _RightXOffset;

float _RightYOffset;

NSString* _ActiveRightAnimation;

BOOL _JetpackActive;

NSString* _IdleRightAnimation;

float _LeftXOffset;

float _LeftYOffset;

NSString* _IdleLeftAnimation;

}
@end

@implementation Design_77_77_gunFollowPlayer

-(void)load
{
	            [mActor makeAlwaysSimulate];
        for(Actor* actorOfType in [self getActorsOfType:_playerActorType])
{
if(actorOfType != nil && !actorOfType.dead){
            _PlayerActor = actorOfType;
}
}

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_77_77_gunFollowPlayer* self = (Design_77_77_gunFollowPlayer*) theScript;
        if(((_PlayerActor != nil) && [Actor isAlive:_PlayerActor]))
{
            [self SyncWithPlayer1];
}

}];

} 

    -(void)SyncWithPlayer1
{
        if(([self sameAs:[_PlayerActor getAnimation] two:@"idle-r"] || [self sameAs:@"jump-r" two:[_PlayerActor getAnimation]]))
{
            [mActor setAnimation:_IdleRightAnimation];
            [mActor setXPosition:([_PlayerActor getX] + _RightXOffset)];
            [mActor setYPosition:([_PlayerActor getY] + _RightYOffset)];
}

        else
{
            [mActor setAnimation:_IdleLeftAnimation];
            [mActor setXPosition:([_PlayerActor getX] + _LeftXOffset)];
            [mActor setYPosition:([_PlayerActor getY] + _LeftYOffset)];
}

        [mActor setXVelocity:[_PlayerActor getXVelocity]];
        [mActor setXVelocity:[_PlayerActor getXVelocity]];
}

    

/* Params are:__Self __Player */
- ( void) Sync1:(NSArray*)args
{
Actor* __Self = mActor;
Actor* __Player = (Actor*) [args objectAtIndex:0];
        _PlayerActor = __Player;
}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end