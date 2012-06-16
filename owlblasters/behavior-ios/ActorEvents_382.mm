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



@interface ActorEvents_382 : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

NSString* _SetThisVar;

float _SetThisVarTo;

NSString* _TextDescription;

NSString* _TextSecondrow;

float _ListNumber;

float _ListValue;

}
@end

@implementation ActorEvents_382

-(void)load
{
	
} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end