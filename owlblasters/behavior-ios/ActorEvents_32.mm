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



@interface ActorEvents_32 : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _StartingHealth;

float _MaximumHealth;

NSString* _LeftAnimation;

NSString* _LeftAnimationIdle;

float _CurrentHealth;

BOOL _CanBeDamaged;

NSString* _HealthIdentifier;

NSString* _ZeroHealthAction;

BOOL _PersistentHealth;

float _xoffset;

float _yoffset;

}
@end

@implementation ActorEvents_32

-(void)load
{
	     
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
ActorEvents_32* self = (ActorEvents_32*) theScript;
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:!ERROR!];
}

        if(([self sameAs:[mActor getAnimation] two:@"jump-l"] || [self sameAs:[mActor getAnimation] two:@"idle-l"]))
{
            [self createRecycledActor:[self getActorType:60] x:([mActor getXCenter] - 40) y:([mActor getYCenter] + 0) layerConst:FRONT];
            [[self getLastCreatedActor] applyImpulse:([self getTouchX] - [mActor getXCenter]) dirY:([self getTouchY] - [mActor getYCenter]) withForce:40];
}

        else
{
            [self createRecycledActor:[self getActorType:60] x:[mActor getXCenter] y:([mActor getYCenter] + 0) layerConst:FRONT];
            [[self getLastCreatedActor] applyImpulse:([self getTouchX] - [mActor getXCenter]) dirY:([self getTouchY] - [mActor getYCenter]) withForce:40];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end