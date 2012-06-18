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
	    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
ActorEvents_32* self = (ActorEvents_32*) theScript;
        [mActor setXVelocity:([Game game].accelX * -70)];
        [mActor setYVelocity:([Game game].accelX * -70)];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end