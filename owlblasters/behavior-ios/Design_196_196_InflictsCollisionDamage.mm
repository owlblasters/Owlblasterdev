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



@interface Design_196_196_InflictsCollisionDamage : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _TopDamageAmount;

float _BottomDamageAmount;

float _RightDamageAmount;

float _LeftDamageAmount;

NSMutableArray* _DamageActorGroups;

}
@end

@implementation Design_196_196_InflictsCollisionDamage

-(void)load
{
	    [self handlesCollisions];

    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_196_196_InflictsCollisionDamage* self = (Design_196_196_InflictsCollisionDamage*) theScript;
        if([Collision fromTop:c actor:mActor])
{
            [mActor sayToBehavior:@"Inflicts Collision Damage" msg:@"ApplyDamage" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:_TopDamageAmount],[mActor getLastCollidedActor],nil]];
}

        if([Collision fromBottom:c actor:mActor])
{
            [mActor sayToBehavior:@"Inflicts Collision Damage" msg:@"ApplyDamage" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:_BottomDamageAmount],[mActor getLastCollidedActor],nil]];
}

        if([Collision fromRight:c actor:mActor])
{
            [mActor sayToBehavior:@"Inflicts Collision Damage" msg:@"ApplyDamage" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:_RightDamageAmount],[mActor getLastCollidedActor],nil]];
}

        if([Collision fromLeft:c actor:mActor])
{
            [mActor sayToBehavior:@"Inflicts Collision Damage" msg:@"ApplyDamage" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:_LeftDamageAmount],[mActor getLastCollidedActor],nil]];
}

}];

} 

    

/* Params are: __Amount __Target */
- ( void) ApplyDamage:(NSArray*)args
{
Actor* __Self = mActor;
float __Amount = (float) [[args objectAtIndex:0] floatValue];

Actor* __Target = (Actor*) [args objectAtIndex:1];
        if([self sameAs:[NSNumber numberWithFloat:__Amount] two:[NSNumber numberWithFloat:0]])
{
            return;
}

        if(([_DamageActorGroups count] == 0))
{
             
            return;
}

        /* @"Make sure our target is in an Actor Group we want to damage." */
        if([_DamageActorGroups containsObject:[self getActorGroup:__Target.groupID]])
{
             
}

}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end