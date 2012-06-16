#import <Box2D/Box2D.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "SceneScript.h"

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



@interface Design_114_114_ReloadSceneOnActorDeath : SceneScript 
{
	@public
		NSString* tempHolder;
		
Actor* _Actor;

float _FadeOutTime;

float _FadeInTime;

}
@end

@implementation Design_114_114_ReloadSceneOnActorDeath

-(void)load
{
	    [self addWhenKilledListener:_Actor func:^(NSMutableArray* list, Script* theScript){
Design_114_114_ReloadSceneOnActorDeath* self = (Design_114_114_ReloadSceneOnActorDeath*) theScript;
        [self reloadCurrentScene:[self createFadeOut:((1000*_FadeOutTime)) color:0] enter:[self createFadeIn:((1000*_FadeInTime)) color:0]];
        [self stopAllSounds];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end