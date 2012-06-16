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



@interface Design_90_90_HealthManager : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _StartingHealth;

float _MaximumHealth;

float _CurrentHealth;

NSString* _HealedMessage;

NSString* _DamagedMessage;

NSString* _ZeroHealthAction;

BOOL _Invincible;

float _DelayBetweenDamage;

BOOL _CanBeDamaged;

BOOL _PersistentHealth;

NSString* _HealthGameAttribute;

NSString* _HealthIdentifier;

SPSound* _DamageSound;

SPSound* _DeathSound;

BOOL _Spawned;

SPSound* _HealSound;

float yOffset;

float xOffset;

NSString* _SpawnType;

Actor* _SpawnedActor;

BOOL _SpawnActorOnDeath;

float lifespan;

float _PercentLeft;

ActorType* _ActorTypeToSpawn;

float _HealthBarXOffset;

NSString* _DrawingLocation;

float _HealthBarYOffset;

float _HealthBarOutlineSize;

float _HealthBarHeight;

float _HealthBarWidth;

NSString* _HealthBarOrientation;

UIColor* _HealthBarOutlineColour;

UIColor* _ColourOver50;

UIColor* _ColourOver25;

UIColor* _ColourOver75;

UIColor* _ColourUnder25;

UIColor* _HealthBarBackgroundColour;

}
@end

@implementation Design_90_90_HealthManager

-(void)load
{
	    [self doesCustomDrawing];
        _CurrentHealth = _StartingHealth;
        
tempHolder = _HealthIdentifier;_HealthIdentifier = @"INTERNALGLOBALHEALTH";
[_HealthIdentifier retain];
[tempHolder release];
        if(_PersistentHealth)
{
            if(!((([self asNumber:[self getGameAttribute:_HealthIdentifier]] <= 0) || ([self asNumber:[self getGameAttribute:_HealthIdentifier]] >= 0))))
{
                [self setGameAttribute:_HealthIdentifier value:[NSNumber numberWithFloat:[self asNumber:[NSNumber numberWithFloat:_CurrentHealth]]]];
}

            else
{
                _CurrentHealth = [self asNumber:[self getGameAttribute:_HealthIdentifier]];
}

}

        if((_CurrentHealth <= 0))
{
            /* @"Trying to spawn with no health, deal the death blow!" */
            if([self sameAs:_ZeroHealthAction two:@"Kill"])
{
                [mActor die];
}

            else if([self sameAs:_ZeroHealthAction two:@"Recycle"])
{
                [self recycleActor:mActor];
}

}

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_90_90_HealthManager* self = (Design_90_90_HealthManager*) theScript;
        _PercentLeft = ((float)[([mActor sayToBehavior:@"Health Manager" msg:@"GetCurrentHealth" withArgs:nil]) floatValue] / (float)[([mActor sayToBehavior:@"Health Manager" msg:@"GetMaxHealth" withArgs:nil]) floatValue]);
}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_90_90_HealthManager* self = (Design_90_90_HealthManager*) theScript;
        if([self sameAs:_DrawingLocation two:@"Screen"])
{
            [self toScreenSpace];
}

        /* @"Draw the health bar background and outline" */
        if((_HealthBarOutlineSize > 0))
{
            [[Game game] setColor:_HealthBarOutlineColour];
            [[Game game] fillRect:(_HealthBarXOffset - _HealthBarOutlineSize) y:(_HealthBarYOffset - _HealthBarOutlineSize) w:(_HealthBarWidth + (_HealthBarOutlineSize * 2)) h:(_HealthBarHeight + (_HealthBarOutlineSize * 2))];
}

        [[Game game] setColor:_HealthBarBackgroundColour];
        [[Game game] fillRect:_HealthBarXOffset y:_HealthBarYOffset w:_HealthBarWidth h:_HealthBarHeight];
        if((_PercentLeft > 0.75))
{
            [[Game game] setColor:_ColourOver75];
}

        else if((_PercentLeft > 0.50))
{
            [[Game game] setColor:_ColourOver50];
}

        else if((_PercentLeft > 0.25))
{
            [[Game game] setColor:_ColourOver25];
}

        else
{
            [[Game game] setColor:_ColourUnder25];
}

        /* @"Draw the current amount of health" */
        if([self sameAs:_HealthBarOrientation two:@"Horizontal"])
{
            [[Game game] fillRect:(_HealthBarXOffset + 1) y:(_HealthBarYOffset + 1) w:(((int) round((_HealthBarWidth * _PercentLeft))) - 2) h:(_HealthBarHeight - 2)];
}

        else
{
            [[Game game] fillRect:(_HealthBarXOffset + 1) y:((_HealthBarYOffset + ((int) round((_HealthBarHeight * (1 - _PercentLeft))))) + 1) w:(_HealthBarWidth - 2) h:(((int) round((_HealthBarHeight * _PercentLeft))) - 2)];
}

}];

} 

    

/* Params are:__Self __Amount */
- ( void) Damage:(NSArray*)args
{
Actor* __Self = mActor;
float __Amount = (float) [[args objectAtIndex:0] floatValue];
        /* @"Don't take any damage if we're invincible" */
        if(((_Invincible || !(_CanBeDamaged)) || (_CurrentHealth <= 0)))
{
            return;
}

        /* @"Make sure health doesn't drop below zero" */
        _CurrentHealth = MAX((_CurrentHealth - __Amount), 0);
        [self UpdateGlobalHealth];
        /* @"Check if Actor has depleted its health" */
        if((_CurrentHealth <= 0))
{
            if(_SpawnActorOnDeath)
{
                [self Death];
}

            if((_DeathSound != nil))
{
                [self playSound:_DeathSound];
}

            if([self sameAs:_ZeroHealthAction two:@"Kill"])
{
                [mActor die];
}

            else if([self sameAs:_ZeroHealthAction two:@"Recycle"])
{
                [self recycleActor:mActor];
}

}

        else
{
            if((_DamagedMessage != nil))
{
                [mActor shout:_DamagedMessage];
}

            if((_DamageSound != nil))
{
                [self playSound:_DamageSound];
}

            /* @"Set up a delay so that the Actor can't be damaged again for this many seconds." */
            if((_DelayBetweenDamage > 0))
{
                _CanBeDamaged = FALSE;
                [self doLater:1000 * _DelayBetweenDamage task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_90_90_HealthManager* self = (Design_90_90_HealthManager*) theScript;
                            if([Actor isAlive:mActor])
{
                                _CanBeDamaged = TRUE;
}

}]];
}

}

}
    

/* Params are:__Self __Amount */
- ( void) Heal:(NSArray*)args
{
Actor* __Self = mActor;
float __Amount = (float) [[args objectAtIndex:0] floatValue];
        /* @"Make sure health doesn't exceed the maximum amount" */
        _CurrentHealth = MIN((_CurrentHealth + __Amount), _MaximumHealth);
        [self UpdateGlobalHealth];
        if((_HealedMessage != nil))
{
            [mActor shout:_HealedMessage];
}

        if((_HealSound != nil))
{
            [self playSound:_HealSound];
}

}
    

/* Params are:__Self */
- ( void) FullRestore:(NSArray*)args
{
Actor* __Self = mActor;
        _CurrentHealth = _MaximumHealth;
        [self UpdateGlobalHealth];
}
    

/* Params are:__Self */
- ( NSNumber*) GetCurrentHealth:(NSArray*)args
{
Actor* __Self = mActor;
        return [NSNumber numberWithFloat:_CurrentHealth];
}
    

/* Params are:__Self */
- ( NSNumber*) GetMaxHealth:(NSArray*)args
{
Actor* __Self = mActor;
        return [NSNumber numberWithFloat:_MaximumHealth];
}
    

/* Params are:__Self __Status */
- ( void) SetInvincibility:(NSArray*)args
{
Actor* __Self = mActor;
BOOL __Status = (BOOL) [[args objectAtIndex:0] boolValue];
        _Invincible = __Status;
}
    

/* Params are:__Self __Amount */
- ( void) SetHealth:(NSArray*)args
{
Actor* __Self = mActor;
float __Amount = (float) [[args objectAtIndex:0] floatValue];
        _CurrentHealth = MIN(__Amount, _MaximumHealth);
        _CurrentHealth = MAX(__Amount, 0);
        [self UpdateGlobalHealth];
}
    

/* Params are:__Self */
- ( NSNumber*) GetInvincibility:(NSArray*)args
{
Actor* __Self = mActor;
        return [NSNumber numberWithBool:_Invincible];
}
    -(void)UpdateGlobalHealth
{
        if(_PersistentHealth)
{
            [self setGameAttribute:_HealthIdentifier value:[NSNumber numberWithFloat:[self asNumber:[NSNumber numberWithFloat:_CurrentHealth]]]];
}

}

    -(void)Death
{
        if(_Spawned)
{
            return;
}

        _Spawned = TRUE;
        if([self sameAs:_SpawnType two:@"Normal"])
{
            [self createActor:_ActorTypeToSpawn x:([mActor getX] + xOffset) y:([mActor getY] + yOffset) layerConst:FRONT];
            _SpawnedActor = [self getLastCreatedActor];
}

        else
{
            [self createRecycledActor:_ActorTypeToSpawn x:([mActor getX] + xOffset) y:([mActor getY] + yOffset) layerConst:FRONT];
            _SpawnedActor = [self getLastCreatedActor];
}

        if((lifespan > 0))
{
            [self doLater:1000 * lifespan task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_90_90_HealthManager* self = (Design_90_90_HealthManager*) theScript;
                        if(((_SpawnedActor != nil) && [Actor isAlive:_SpawnedActor]))
{
                            if([self sameAs:_SpawnType two:@"Normal"])
{
                                [_SpawnedActor die];
}

                            else
{
                                [self recycleActor:_SpawnedActor];
}

}

}]];
}

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end