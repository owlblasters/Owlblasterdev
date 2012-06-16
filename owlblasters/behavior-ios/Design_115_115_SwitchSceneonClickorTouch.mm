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



@interface Design_115_115_SwitchSceneonClickorTouch : SceneScript 
{
	@public
		NSString* tempHolder;
		
Scene* _NextScene;

float _FadeOutTime;

float _FadeInTime;

}
@end

@implementation Design_115_115_SwitchSceneonClickorTouch

-(void)load
{
	     
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
Design_115_115_SwitchSceneonClickorTouch* self = (Design_115_115_SwitchSceneonClickorTouch*) theScript;
        if(((_NextScene != nil) && !([self isTransitioning])))
{
            [self switchScene:_NextScene.ID leave:[self createFadeOut:((1000*_FadeOutTime)) color:0] enter:[self createFadeIn:((1000*_FadeInTime)) color:0]];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end