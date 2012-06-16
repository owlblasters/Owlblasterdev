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



@interface Design_224_224_InflictsDamage : ActorScript 
{
	@public
		NSString* tempHolder;
		
float damage;

}
@end

@implementation Design_224_224_InflictsDamage

-(void)load
{
	            /* @"Damage is specified by an attribute, which the Health snippet asks for." */

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end