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



@interface Design_230_230_PickupWeapon : ActorScript 
{
	@public
		NSString* tempHolder;
		
SPSound* _Sound;

float _Number;

float _Gun;

float _Sword;

float _Weapons;

}
@end

@implementation Design_230_230_PickupWeapon

-(void)load
{
	    [self handlesCollisions];

    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_230_230_PickupWeapon* self = (Design_230_230_PickupWeapon*) theScript;
        if([Collision collidedWithActor:c actor:mActor])
{
            [self playSound:_Sound];
            [self setGameAttribute:@"SoundEffectsOn" value:[NSNumber numberWithFloat:_Number]];
            if([self sameAs:[NSNumber numberWithFloat:_Weapons] two:[NSNumber numberWithFloat:0]])
{
                [self setGameAttribute:@"BackgroundMscOn" value:[NSNumber numberWithFloat:_Sword]];
}

            if([self sameAs:[NSNumber numberWithFloat:_Weapons] two:[NSNumber numberWithFloat:1]])
{
                [self setGameAttribute:@"CreditsNeeded" value:[NSNumber numberWithFloat:_Gun]];
}

            [mActor die];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end