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



@interface SceneEvents_20 : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _Cutscene1;

float _Cutscene2;

Actor* _CutsceneJumper;

ActorType* _Jumper;

}
@end

@implementation SceneEvents_20

-(void)load
{
	
} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end