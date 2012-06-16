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



@interface Design_1_1_GunFiring : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _FacingLeft;

BOOL _AbletoFire;

float _MaxFireSpeed;

float _BulletVelocity;

SPSound* _GunFireSound;

}
@end

@implementation Design_1_1_GunFiring

-(void)load
{
	            if([mActor hasBehavior:@"Walking"])
{
            if([self sameAs:[mActor getAttributeForBehavior:@"Walking" att:@"_InitiallyFacingRight"] two:[NSNumber numberWithBool:TRUE]])
{
                _FacingLeft = FALSE;
}

            else
{
                _FacingLeft = TRUE;
}

}

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_1_1_GunFiring* self = (Design_1_1_GunFiring*) theScript;
        if(([self isKeyPressed:@"right"] && _AbletoFire))
{
            _AbletoFire = FALSE;
            if([self asBoolean:[mActor getActorValue:@"Facing Right?"]])
{
                if([self sameAs:[NSNumber numberWithFloat:[self asNumber:[mActor getActorValue:@"Weapon"]]] two:[NSNumber numberWithFloat:0]])
{
                    /* @"Fire Weapon 0 Right" */
                    [self createActor:[self getActorType:435] x:([mActor getX] + 96) y:([mActor getY] + 12) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:_BulletVelocity];
}

                else
{
                    /* @"Fire Weapon 1 Right" */
                    [self createActor:[self getActorType:480] x:([mActor getX] + 88) y:([mActor getY] + 20) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:_BulletVelocity];
                    [[self getLastCreatedActor] setYVelocity:5];
                    [self createActor:[self getActorType:480] x:([mActor getX] + 88) y:([mActor getY] + 20) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:_BulletVelocity];
                    [self createActor:[self getActorType:480] x:([mActor getX] + 88) y:([mActor getY] + 20) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:_BulletVelocity];
                    [[self getLastCreatedActor] setYVelocity:-5];
}

}

            else
{
                if([self sameAs:[NSNumber numberWithFloat:[self asNumber:[mActor getActorValue:@"Weapon"]]] two:[NSNumber numberWithFloat:0]])
{
                    /* @"Fire Weapon 0 Left" */
                    [self createActor:[self getActorType:435] x:([mActor getX] + -8) y:([mActor getY] + 12) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:-(_BulletVelocity)];
}

                else
{
                    /* @"Fire Weapon 1 Left" */
                    [self createActor:[self getActorType:480] x:([mActor getX] + -8) y:([mActor getY] + 20) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:-(_BulletVelocity)];
                    [[self getLastCreatedActor] setYVelocity:5];
                    [self createActor:[self getActorType:480] x:([mActor getX] + -8) y:([mActor getY] + 20) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:-(_BulletVelocity)];
                    [self createActor:[self getActorType:480] x:([mActor getX] + -8) y:([mActor getY] + 20) layerConst:BACK];
                    [[self getLastCreatedActor] setXVelocity:-(_BulletVelocity)];
                    [[self getLastCreatedActor] setYVelocity:-5];
}

}

            [self playSound:_GunFireSound];
            [self doLater:1000 * _MaxFireSpeed task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_1_1_GunFiring* self = (Design_1_1_GunFiring*) theScript;
                        _AbletoFire = TRUE;
}]];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end