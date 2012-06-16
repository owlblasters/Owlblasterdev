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



@interface Design_29_29_EnemyFireProjectile : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _Delay;

BOOL _Firing;

Actor* _Player;

float _FiringSpeed;

}
@end

@implementation Design_29_29_EnemyFireProjectile

-(void)load
{
	            /* @"This prevents the enemy from shooting as soon as it comes on screen, since that's annoying and would cause cheap deaths." */
        _Firing = TRUE;
        [self doLater:1000 * _Delay task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_29_29_EnemyFireProjectile* self = (Design_29_29_EnemyFireProjectile*) theScript;
                    _Firing = FALSE;
}]];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_29_29_EnemyFireProjectile* self = (Design_29_29_EnemyFireProjectile*) theScript;
        if(!(_Firing))
{
            _Firing = TRUE;
            [self createActor:[self getActorType:484] x:([mActor getXCenter] - 20) y:([mActor getYCenter] - 28) layerConst:BACK];
            /* @"This long math block determines the angle between the firing enemy and the player. The +20 and +12 are so that it shoots more toward the center of the player actor." */
            [[self getLastCreatedActor] setVelocityAtAngle:SP_R2D(atan2((([[self getGameAttribute:@"SoundEffectsOn"] floatValue] + 20) - [mActor getY]), (([[self getGameAttribute:@"Player_Health"] floatValue] + 12) - [mActor getX]))) withSpeed:_FiringSpeed];
            [self doLater:1000 * _Delay task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_29_29_EnemyFireProjectile* self = (Design_29_29_EnemyFireProjectile*) theScript;
                        _Firing = FALSE;
}]];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end