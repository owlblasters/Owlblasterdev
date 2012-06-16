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



@interface Design_63_63_SpawnMinions : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _Delay;

float _OffsetX;

float _OffsetY;

ActorType* _Minion;

}
@end

@implementation Design_63_63_SpawnMinions

-(void)load
{
	    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_63_63_SpawnMinions* self = (Design_63_63_SpawnMinions*) theScript;
        [self doPeriodically:1000 * _Delay task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_63_63_SpawnMinions* self = (Design_63_63_SpawnMinions*) theScript;
                    [self createActor:_Minion x:([mActor getX] + [Script randomIntBetween:(int)-(_OffsetX) to:(int)_OffsetX]) y:([mActor getY] + [Script randomIntBetween:(int)-(_OffsetY) to:(int)_OffsetY]) layerConst:MIDDLE];
}]];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end