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



@interface ActorEvents_60 : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _DMG1;

}
@end

@implementation ActorEvents_60

-(void)load
{
	            [mActor setActorValue:@"DMG" value:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) objectAtIndex:0] floatValue]]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end