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



@interface Design_23_23_Health : ActorScript 
{
	@public
		NSString* tempHolder;
		
float defaultDmg;

float cacheDmg;

float currHealth;

float maxHealth;

float initHealth;

Actor* actorCache;

BOOL dieOnDepletedHealth;

BOOL isInvincible;

BOOL isTempInvulnerable;

float tempInvulnerabilityTime;

float sameActorCollideAfter;

BOOL _beingHit;

}
@end

@implementation Design_23_23_Health

-(void)load
{
	    [self handlesCollisions];
        currHealth = initHealth;
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_23_23_Health* self = (Design_23_23_Health*) theScript;
        [mActor setActorValue:@"hitPoints" value:[NSNumber numberWithFloat:currHealth]];
}];
    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_23_23_Health* self = (Design_23_23_Health*) theScript;
        if(isTempInvulnerable)
{
            return;
}

        if([Collision collidedWithTile:c actor:mActor])
{

}

        if(isInvincible)
{
            return;
}

        if(((actorCache != nil) &&  ))
{
            return;
}

        if([[mActor getLastCollidedActor] hasBehavior:@"Inflicts Damage"])
{
            cacheDmg = [self asNumber:[[mActor getLastCollidedActor] getAttributeForBehavior:@"Inflicts Damage" att:@"damage"]];
}

        else
{
            cacheDmg = defaultDmg;
}

        actorCache = [mActor getLastCollidedActor];
        if((sameActorCollideAfter > 0))
{
            [self doLater:1000 * sameActorCollideAfter task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_23_23_Health* self = (Design_23_23_Health*) theScript;
                        actorCache = nil;
}]];
}

        if(((cacheDmg > 0) && !(_beingHit)))
{
            currHealth -= cacheDmg;
            _beingHit = TRUE;
            //NO-OP
            [mActor shout:@"tookDamage"];
            [self doLater:1000 * 0.2 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_23_23_Health* self = (Design_23_23_Health*) theScript;
                        _beingHit = FALSE;
                        //NO-OP
}]];
}

        if((tempInvulnerabilityTime > 0))
{
            isTempInvulnerable = TRUE;
            [self doLater:1000 * tempInvulnerabilityTime task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_23_23_Health* self = (Design_23_23_Health*) theScript;
                        isTempInvulnerable = FALSE;
}]];
}

}];

} 

    

/* Params are:__Self */
- ( void) makeInvincible:(NSArray*)args
{
Actor* __Self = mActor;
        isInvincible = TRUE;
}
    -(void)tookDamage
{
        if((currHealth <= 0))
{
            [mActor shout:@"healthDepleted"];
            if(dieOnDepletedHealth)
{
                [mActor die];
}

}

}

    

/* Params are:__Self __amount */
- ( void) heal:(NSArray*)args
{
Actor* __Self = mActor;
float __amount = (float) [[args objectAtIndex:0] floatValue];
        currHealth += __amount;
        currHealth = MIN(__amount, maxHealth);
        currHealth = MAX(__amount, 0);
}
    

/* Params are:__Self */
- ( void) restore:(NSArray*)args
{
Actor* __Self = mActor;
        currHealth = maxHealth;
}
    

/* Params are:__Self */
- ( NSNumber*) getHealth:(NSArray*)args
{
Actor* __Self = mActor;
        return [NSNumber numberWithFloat:currHealth];
}
    

/* Params are:__Self __amount */
- ( void) damage:(NSArray*)args
{
Actor* __Self = mActor;
float __amount = (float) [[args objectAtIndex:0] floatValue];
        cacheDmg = __amount;
        currHealth -= cacheDmg;
        [self tookDamage];
}
    

/* Params are:__Self */
- ( void) makeVulnerable:(NSArray*)args
{
Actor* __Self = mActor;
        isInvincible = FALSE;
}
    

/* Params are:__Self __amount */
- ( void) setHealth:(NSArray*)args
{
Actor* __Self = mActor;
float __amount = (float) [[args objectAtIndex:0] floatValue];
        currHealth = MIN(__amount, maxHealth);
        currHealth = MAX(__amount, 0);
}
    -(void)healSelf
{
        [mActor sayToBehavior:@"Health" msg:@"restore" withArgs:nil];
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end