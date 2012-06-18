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



@interface ActorEvents_312 : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _velocitydirection;

float _lastsfor;

float _repeattime;

}
@end

@implementation ActorEvents_312

-(void)load
{
	            _velocitydirection = 90;
        [mActor setActorValue:@"dir" value:[NSNumber numberWithFloat:0]];
    [self doPeriodically:1000 * _repeattime task:[self createRunnable:^(Runnable* parent, Script* theScript){
ActorEvents_312* self = (ActorEvents_312*) theScript;
        _velocitydirection = (_velocitydirection + ((180 / (_lastsfor / _repeattime)) * [self asNumber:[mActor getActorValue:@"dir"]]));
        [mActor setVelocityAtAngle:_velocitydirection withSpeed:40];
        [mActor setXVelocity:([mActor getXVelocity] + [[self getGameAttribute:@"PlayerMoveSpeed"] floatValue])];
}]];
    [self doLater:1000 * _lastsfor task:[self createRunnable:^(Runnable* parent, Script* theScript){
ActorEvents_312* self = (ActorEvents_312*) theScript;
        [self recycleActor:mActor];
}]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end