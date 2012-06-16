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



@interface Design_88_88_PickUpWeapons : ActorScript 
{
	@public
		NSString* tempHolder;
		
SPSound* _sound;

float _number;

float _Sword;

float _Gun;

float _Weapons;

}
@end

@implementation Design_88_88_PickUpWeapons

-(void)load
{
	    [self handlesCollisions];

    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_88_88_PickUpWeapons* self = (Design_88_88_PickUpWeapons*) theScript;
        if([Collision collidedWithActor:c actor:mActor])
{
            [self playSound:_sound];
            [self setGameAttribute:@"Player_Health" value:[NSNumber numberWithFloat:_number]];
            if([self sameAs:[NSNumber numberWithFloat:_Weapons] two:[NSNumber numberWithFloat:0]])
{
                [self setGameAttribute:@"SoundEffectsOn" value:[NSNumber numberWithFloat:_Sword]];
}

            if([self sameAs:[NSNumber numberWithFloat:_Weapons] two:[NSNumber numberWithFloat:1]])
{
                [self setGameAttribute:@"BackgroundMscOn" value:[NSNumber numberWithFloat:_Gun]];
}

            [mActor die];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end