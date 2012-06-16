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



@interface Design_87_87_PickupGun : ActorScript 
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

@implementation Design_87_87_PickupGun

-(void)load
{
	    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_87_87_PickupGun* self = (Design_87_87_PickupGun*) theScript;
        if([Collision collidedWithActor:c actor:mActor])
{
            [self playSound:_Sound];
            [mActor die];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end