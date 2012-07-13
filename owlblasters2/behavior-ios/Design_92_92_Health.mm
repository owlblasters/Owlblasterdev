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



@interface Design_92_92_Health : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _beingHit;

BOOL _TemporarilyInvulnerable;

Actor* _actorCache;

float _currHealth;

float _cacheDmg;

float _InitialHealth;

float _MaxHealth;

float _DefaultDamage;

BOOL dieOnDeplete;

float _CollideWithSameActorAfter;

BOOL _IsInvincible;

float _TemporaryInvulnerabilityTime;

}
@end

@implementation Design_92_92_Health

-(void)load
{
	    [self handlesCollisions];
        _currHealth = [[self getGameAttribute:@"Player_Health"] floatValue];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_92_92_Health* self = (Design_92_92_Health*) theScript;
        [mActor setActorValue:@"hitPoints" value:[NSNumber numberWithFloat:_currHealth]];
        [mActor setActorValue:@"maxHealth" value:[NSNumber numberWithFloat:_MaxHealth]];
}];
    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_92_92_Health* self = (Design_92_92_Health*) theScript;
        if(_TemporarilyInvulnerable)
{
            return;
}

        if(_IsInvincible)
{
            return;
}

        if(((_actorCache != nil) && [self sameAs:_actorCache two:[mActor getLastCollidedActor]]))
{
            return;
}

        if([[mActor getLastCollidedActor] hasBehavior:@"Inflicts Damage"])
{
            _cacheDmg = [self asNumber:[[mActor getLastCollidedActor] getAttributeForBehavior:@"Inflicts Damage" att:@"damage"]];
}

        else if(([self asNumber:[[mActor getLastCollidedActor] getActorValue:@"DMG"]] > 0))
{
            _cacheDmg = [self asNumber:[[mActor getLastCollidedActor] getActorValue:@"DMG"]];
}

        else
{
            _cacheDmg = _DefaultDamage;
}

        _actorCache = [mActor getLastCollidedActor];
        if((_CollideWithSameActorAfter > 0))
{
            [self doLater:1000 * _CollideWithSameActorAfter task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_92_92_Health* self = (Design_92_92_Health*) theScript;
                        _actorCache = nil;
}]];
}

        if(((_cacheDmg > 0) && !(_beingHit)))
{
            _currHealth -= _cacheDmg;
            _beingHit = TRUE;
            [mActor shout:@"tookDamage"];
            [self doLater:1000 * 0.2 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_92_92_Health* self = (Design_92_92_Health*) theScript;
                        _beingHit = FALSE;
}]];
}

        if((_TemporaryInvulnerabilityTime > 0))
{
            _TemporarilyInvulnerable = TRUE;
            [self doLater:1000 * _TemporaryInvulnerabilityTime task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_92_92_Health* self = (Design_92_92_Health*) theScript;
                        _TemporarilyInvulnerable = FALSE;
}]];
}

}];

} 

    

/* Params are:__Self */
- ( void) makeInvincible:(NSArray*)args
{
Actor* __Self = mActor;
        _IsInvincible = TRUE;
}
    -(void)tookDamage
{
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:[self getSound:83]];
}

        if((_currHealth <= 0))
{
            [mActor shout:@"healthDepleted"];
            if(dieOnDeplete)
{
                if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                    [self playSound:[self getSound:83]];
}

                [mActor die];
}

}

}

    

/* Params are:__Self __amount */
- ( void) heal:(NSArray*)args
{
Actor* __Self = mActor;
float __amount = (float) [[args objectAtIndex:0] floatValue];
        _currHealth += __amount;
        _currHealth = MIN(__amount, _MaxHealth);
        _currHealth = MAX(_currHealth, 0);
}
    

/* Params are:__Self */
- ( void) restore:(NSArray*)args
{
Actor* __Self = mActor;
        _currHealth = _MaxHealth;
}
    

/* Params are:__Self */
- ( NSNumber*) getHealth:(NSArray*)args
{
Actor* __Self = mActor;
        return [NSNumber numberWithFloat:_currHealth];
}
    

/* Params are:__Self __amount */
- ( void) damage:(NSArray*)args
{
Actor* __Self = mActor;
float __amount = (float) [[args objectAtIndex:0] floatValue];
        if(!(_IsInvincible))
{
            _cacheDmg = __amount;
            _currHealth -= _cacheDmg;
            [self tookDamage];
}

}
    

/* Params are:__Self */
- ( void) makeVulnerable:(NSArray*)args
{
Actor* __Self = mActor;
        _IsInvincible = FALSE;
}
    

/* Params are:__Self __amount */
- ( void) setHealth:(NSArray*)args
{
Actor* __Self = mActor;
float __amount = (float) [[args objectAtIndex:0] floatValue];
        _currHealth = MIN(__amount, _MaxHealth);
        _currHealth = MAX(_currHealth, 0);
}
    -(void)healSelf
{
        [mActor sayToBehavior:@"Health" msg:@"restore" withArgs:nil];
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end