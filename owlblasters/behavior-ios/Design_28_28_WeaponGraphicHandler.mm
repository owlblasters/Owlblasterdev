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



@interface Design_28_28_WeaponGraphicHandler : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _Weapon;

float _NumberofWeapons;

Actor* _WeaponGraphic;

}
@end

@implementation Design_28_28_WeaponGraphicHandler

-(void)load
{
	            _Weapon = 0;
        [mActor setActorValue:@"Weapon" value:[NSNumber numberWithFloat:_Weapon]];
        [self createActor:[self getActorType:486] x:([mActor getX] + 34) y:([mActor getY] + 5) layerConst:FRONT];
        _WeaponGraphic = [self getLastCreatedActor];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_28_28_WeaponGraphicHandler* self = (Design_28_28_WeaponGraphicHandler*) theScript;
        if([self asBoolean:[mActor getActorValue:@"Facing Right?"]])
{
            [_WeaponGraphic setXPosition:( + 34)];
            [_WeaponGraphic setYPosition:( + 0)];
            [_WeaponGraphic setAnimation:@"Right"];
            [_WeaponGraphic setCurrentFrame:_Weapon];
}

        else
{
            [_WeaponGraphic setXPosition:( + -10)];
            [_WeaponGraphic setYPosition:( + 0)];
            [_WeaponGraphic setAnimation:@"Left"];
            [_WeaponGraphic setCurrentFrame:_Weapon];
}

        if([self isKeyPressed:@"action2"])
{
            _Weapon += 1;
            if([self sameAs:[NSNumber numberWithFloat:_Weapon] two:[NSNumber numberWithFloat:_NumberofWeapons]])
{
                _Weapon = 0;
}

            [mActor setActorValue:@"Weapon" value:[NSNumber numberWithFloat:_Weapon]];
}

}];

} 

    -(void)healthDepleted
{
        [_WeaponGraphic die];
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end