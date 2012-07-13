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



@interface Design_24_24_SpawnActoruponDeath : ActorScript 
{
	@public
		NSString* tempHolder;
		
ActorType* actTypeToSpawn;

float xOffset;

float yOffset;

float lifespan;

Actor* _SpawnedActor;

SPSound* _Explode;

}
@end

@implementation Design_24_24_SpawnActoruponDeath

-(void)load
{
	    

} 

    -(void)healthDepleted
{
        [self createActor:actTypeToSpawn x:([mActor getXCenter] + xOffset) y:([mActor getYCenter] + yOffset) layerConst:FRONT];
        _SpawnedActor = [self getLastCreatedActor];
        [self playSound:_Explode];
        [[Game game] shakeScreen:2*0.01 forDuration:.2*1000];
        [self doLater:1000 * lifespan task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_24_24_SpawnActoruponDeath* self = (Design_24_24_SpawnActoruponDeath*) theScript;
                    [_SpawnedActor die];
}]];
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end