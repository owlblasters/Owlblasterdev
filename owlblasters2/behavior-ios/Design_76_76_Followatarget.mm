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



@interface Design_76_76_Followatarget : ActorScript 
{
	@public
		NSString* tempHolder;
		
ActorType* _Typetolocate;

ActorType* _Typetofollow;

Actor* _Target;

Region* _DetectRange;

BOOL _CanFollow;

BOOL _CollideWithPlayer;

Actor* _Leader;

float _TargetDirection;

float _FollowSpeed;

float _TargetRegionHeight;

float _TargetRegionWidth;

BOOL _isSwooping;

float _SwoopXSpeed;

}
@end

@implementation Design_76_76_Followatarget

-(void)load
{
	    

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end