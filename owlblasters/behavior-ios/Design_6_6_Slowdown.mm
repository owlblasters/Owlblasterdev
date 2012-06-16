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



@interface Design_6_6_Slowdown : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _RightKey;

NSString* _LeftKey;

float _GroundSlowdown;

float _AirSlowdown;

float _DuckingSlowdown;

float _MovingAirSlowdown;

float _WaterSlowdown;

}
@end

@implementation Design_6_6_Slowdown

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_6_6_Slowdown* self = (Design_6_6_Slowdown*) theScript;
        if([self asBoolean:[mActor getActorValue:@"Is Slope Sliding?"]])
{
            return;
}

        if((!([self isKeyDown:_RightKey]) && !([self isKeyDown:_LeftKey])))
{
            if([self asBoolean:[mActor getActorValue:@"On Ground?"]])
{
                [mActor setXVelocity:([mActor getXVelocity] * _GroundSlowdown)];
}

            else
{
                if([self asBoolean:[mActor getActorValue:@"Is Underwater?"]])
{
                    [mActor setXVelocity:([mActor getXVelocity] * _WaterSlowdown)];
}

                else
{
                    [mActor setXVelocity:([mActor getXVelocity] * _AirSlowdown)];
}

}

            return;
}

        if(([self asBoolean:[mActor getActorValue:@"Is Ducking?"]] && [self asBoolean:[mActor getActorValue:@"On Ground?"]]))
{
            [mActor setXVelocity:([mActor getXVelocity] * _DuckingSlowdown)];
}

        if(!([self asBoolean:[mActor getActorValue:@"On Ground?"]]))
{
            [mActor setXVelocity:([mActor getXVelocity] * _MovingAirSlowdown)];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end