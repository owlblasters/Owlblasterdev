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



@interface Design_12_12_CreateDust : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _Delay;

BOOL _CreatingTracer;

BOOL _Trace;

}
@end

@implementation Design_12_12_CreateDust

-(void)load
{
	            _Trace = TRUE;
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_12_12_CreateDust* self = (Design_12_12_CreateDust*) theScript;
        if((((!(_CreatingTracer) && _Trace) && (fabs([mActor getXVelocity]) > 1)) && [self asBoolean:[mActor getActorValue:@"On Ground?"]]))
{
            _CreatingTracer = TRUE;
            [self doLater:1000 * _Delay task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_12_12_CreateDust* self = (Design_12_12_CreateDust*) theScript;
                        if([Actor isAlive:mActor])
{
                            if([self asBoolean:[mActor getActorValue:@"Facing Right?"]])
{
                                [self createRecycledActor:[self getActorType:472] x:([mActor getXCenter] + -24) y:([mActor getYCenter] + 28) layerConst:BACK];
}

                            else
{
                                [self createRecycledActor:[self getActorType:472] x:([mActor getXCenter] + 14) y:([mActor getYCenter] + 28) layerConst:BACK];
}

                            [[self getLastCreatedActor] setYVelocity:[Script randomIntBetween:(int)-15 to:(int)-20]];
                            _CreatingTracer = FALSE;
}

}]];
}

}];

} 

    -(void)Trace
{
        _Trace = TRUE;
}

    -(void)StopTrace
{
        _Trace = FALSE;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end