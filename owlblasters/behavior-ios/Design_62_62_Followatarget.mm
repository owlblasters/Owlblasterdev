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



@interface Design_62_62_Followatarget : ActorScript 
{
	@public
		NSString* tempHolder;
		
ActorType* _Typetolocate;

ActorType* _Typetofollow;

Actor* _Target;

Region* _DetectRange;

BOOL _CanFollow;

BOOL _CollideWithPlayer;

Actor* _Leader;

float _TargetDirection;

float _FollowSpeed;

float _TargetRegionHeight;

float _TargetRegionWidth;

BOOL _isSwooping;

float _SwoopXSpeed;

}
@end

@implementation Design_62_62_Followatarget

-(void)load
{
	            for(Actor* actorOfType in [self getActorsOfType:_Typetolocate])
{
if(actorOfType != nil && !actorOfType.dead){
            _Target = actorOfType;
}
}

        /* @"This is for identifying the actor that will have the Region on them" */
        _CollideWithPlayer = FALSE;
        for(Actor* actorOfType in [self getActorsOfType:_Typetofollow])
{
if(actorOfType != nil && !actorOfType.dead){
            _Leader = actorOfType;
}
}

        /* @"This is to define the actor to follow." */
        /* @"at some point I need to combine the two above into one attribute." */
        [self createBoxRegion:[_Target getX] y:[_Target getY] w:_TargetRegionWidth h:_TargetRegionHeight];
        _DetectRange = [self getLastCreatedRegion];
        /* @"This set's the region aroud the Type to follow target, adjust the size to best fit your actor." */
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_62_62_Followatarget* self = (Design_62_62_Followatarget*) theScript;
        if(!(_isSwooping))
{
            if([Actor isAlive:_Target])
{
                [_DetectRange follow:_Target];
                _CanFollow = !(_CollideWithPlayer);
                /* @"Makes the \"DetectRange\" Region Attribute Follow the actor in the \"Target\" actor attribute." */
                /* @"Which should be the player." */
                _TargetDirection = atan2(([mActor getY] - [_Leader getY]), ([mActor getX] - [_Leader getX]));
                if([self isInRegion:mActor r:_DetectRange])
{
                    _CanFollow = FALSE;
}

                if((_Target != nil))
{
                    if(_CanFollow)
{
                        if(((SP_R2D(_TargetDirection) >= -5) && (SP_R2D(_TargetDirection) <= 5)))
{
                            /* @"Left/West" */
                            [mActor setXVelocity:-(_FollowSpeed)];
                            [mActor setYVelocity:0];
}

                        if(((SP_R2D(_TargetDirection) >= 6) && (SP_R2D(_TargetDirection) <= 89)))
{
                            /* @"Upper Left/Northwest" */
                            [mActor setXVelocity:-(_FollowSpeed)];
                            [mActor setYVelocity:-(_FollowSpeed)];
}

                        if(((SP_R2D(_TargetDirection) >= 90) && (SP_R2D(_TargetDirection) <= 95)))
{
                            /* @"Up/North" */
                            [mActor setXVelocity:0];
                            [mActor setYVelocity:-(_FollowSpeed)];
}

                        if(((SP_R2D(_TargetDirection) >= 96) && (SP_R2D(_TargetDirection) <= 175)))
{
                            /* @"Upper Right/Northeast" */
                            [mActor setXVelocity:_FollowSpeed];
                            [mActor setYVelocity:-(_FollowSpeed)];
}

                        if(((SP_R2D(_TargetDirection) >= 176) && (SP_R2D(_TargetDirection) <= 180)))
{
                            /* @"Right/East" */
                            [mActor setXVelocity:_FollowSpeed];
                            [mActor setYVelocity:0];
}

                        if(((SP_R2D(_TargetDirection) >= -179) && (SP_R2D(_TargetDirection) <= -170)))
{
                            /* This is a second Right/East one because at this point it becomes -179 to 0 on the lower half circle.
also note that these numbers are backwards because a -50 has more value than a -70. being */
                            /* @"Below 0 and all." */
                            /* @"Right/East" */
                            [mActor setXVelocity:_FollowSpeed];
                            [mActor setYVelocity:0];
}

                        if(((SP_R2D(_TargetDirection) >= -169) && (SP_R2D(_TargetDirection) <= -96)))
{
                            /* @"Lower Right/Southeast" */
                            [mActor setXVelocity:_FollowSpeed];
                            [mActor setYVelocity:_FollowSpeed];
}

                        if(((SP_R2D(_TargetDirection) >= -95) && (SP_R2D(_TargetDirection) <= -87)))
{
                            /* @"Down/South" */
                            [mActor setXVelocity:0];
                            [mActor setYVelocity:_FollowSpeed];
}

                        if(((SP_R2D(_TargetDirection) >= -86) && (SP_R2D(_TargetDirection) <= -6)))
{
                            /* @"Lower Left/Southwest" */
                            [mActor setXVelocity:-(_FollowSpeed)];
                            [mActor setYVelocity:_FollowSpeed];
}

                        _CollideWithPlayer = FALSE;
}

}

                if(!(_CanFollow))
{
                    [mActor setXVelocity:0];
                    [mActor setYVelocity:0];
                    /* Stops once it is within range of the Target Actor's region. */
}

}

}

        else
{
            [mActor setYVelocity:20];
            [mActor setXVelocity:_SwoopXSpeed];
}

}];
    [self doPeriodically:1000 * .5 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_62_62_Followatarget* self = (Design_62_62_Followatarget*) theScript;
        _isSwooping = TRUE;
        if([self sameAs:[NSNumber numberWithFloat:[Script randomIntBetween:(int)0 to:(int)1]] two:[NSNumber numberWithFloat:0]])
{
            _SwoopXSpeed = [Script randomIntBetween:(int)30 to:(int)50];
}

        else
{
            _SwoopXSpeed = [Script randomIntBetween:(int)-30 to:(int)-50];
}

        [self doLater:1000 * .2 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_62_62_Followatarget* self = (Design_62_62_Followatarget*) theScript;
                    _isSwooping = FALSE;
}]];
}]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end