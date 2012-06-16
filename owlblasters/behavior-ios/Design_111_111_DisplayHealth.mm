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



@interface Design_111_111_DisplayHealth : SceneScript 
{
	@public
		NSString* tempHolder;
		
ActorType* _HealthActorType;

Actor* _Player;

Actor* _HealthActor;

float _XPosition;

float _YPosition;

}
@end

@implementation Design_111_111_DisplayHealth

-(void)load
{
	            [self createActor:_HealthActorType x:_XPosition y:_YPosition layerConst:FRONT];
        _HealthActor = [self getLastCreatedActor];
        [_HealthActor anchorToScreen];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_111_111_DisplayHealth* self = (Design_111_111_DisplayHealth*) theScript;
        [_HealthActor setAnimation:[NSString stringWithFormat:@"%@", @""]];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end