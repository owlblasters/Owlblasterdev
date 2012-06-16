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



@interface Design_43_43_ShootAroundtheClock : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _BulletSpeed;

ActorType* _ActorType;

float _Offset;

BOOL _Recycled;

NSString* _FireControl;

BOOL _AbsoluteDirection;

float _FireDirection;

BOOL _UsetheMouse;

BOOL _UseControls;

float _MaximumBulletsAlive;

BOOL _LimitBulletsAlive;

BOOL _Fire;

float _BulletsAlive;

float _RateOfFire;

BOOL _Wait;

float _CurrentAmmunition;

float _MaximumAmmunition;

float _NumberofBullets;

BOOL _UseAmmunition;

float _BulletSpread;

}
@end

@implementation Design_43_43_ShootAroundtheClock

-(void)load
{
	    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_43_43_ShootAroundtheClock* self = (Design_43_43_ShootAroundtheClock*) theScript;
        if((_ActorType != nil))
{
             
            if(_UseControls)
{
                _Fire = (_Fire || [self isKeyDown:_FireControl]);
}

            if(_Fire)
{
                _Fire = FALSE;
                if(_LimitBulletsAlive)
{
                    _BulletsAlive = 0;
                    for(Actor* actorOfType in [self getActorsOfType:_ActorType])
{
if(actorOfType != nil && !actorOfType.dead){
                        if([self sameAs:[actorOfType getActorValue:@"FireBullet_Creator"] two:mActor])
{
                            _BulletsAlive += 1;
                            if((_BulletsAlive >= _MaximumBulletsAlive))
{
                                return;
}

}

}
}

}

                if((!(_Wait) && (!(_UseAmmunition) || (_CurrentAmmunition > 0))))
{
                    _Wait = TRUE;
                    [self doLater:1000 * (1 / _RateOfFire) task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_43_43_ShootAroundtheClock* self = (Design_43_43_ShootAroundtheClock*) theScript;
                                if([Actor isAlive:mActor])
{
                                    _Wait = FALSE;
}

}]];
                    for(int index0 = 0; index0 < _NumberofBullets; index0++)
{
                        if(_Recycled)
{
                            [self createRecycledActor:_ActorType x:0 y:0 layerConst:FRONT];
}

                        else
{
                            [self createActor:_ActorType x:0 y:0 layerConst:FRONT];
                            [self playSound:[self getSound:59]];
}

                        _BulletSpread = (360 / _NumberofBullets);
                        _FireDirection = (index0 * _BulletSpread);
                        if(!(_AbsoluteDirection))
{
                            _FireDirection += SP_R2D([mActor getAngle]);
}

                        if(_UseAmmunition)
{
                            _CurrentAmmunition -= 1;
}

                        [[self getLastCreatedActor] setXPosition:(([mActor getXCenter] - [[self getLastCreatedActor] getWidth]/2) + (_Offset * cos(SP_D2R(_FireDirection))))];
                        [[self getLastCreatedActor] setYPosition:(([mActor getYCenter] - [[self getLastCreatedActor] getHeight]/2) + (_Offset * sin(SP_D2R(_FireDirection))))];
                        [[self getLastCreatedActor] setVelocityAtAngle:_FireDirection withSpeed:_BulletSpeed];
                        [[self getLastCreatedActor] setActorValue:@"FireBullet_Creator" value:mActor];
}

}

}

}

}];

} 

    -(void)FireBullet
{
        _Fire = TRUE;
}

    -(void)Reload
{
        _CurrentAmmunition = _MaximumAmmunition;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end