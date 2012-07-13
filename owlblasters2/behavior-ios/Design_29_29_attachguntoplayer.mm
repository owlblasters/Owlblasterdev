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



@interface Design_29_29_attachguntoplayer : ActorScript 
{
	@public
		NSString* tempHolder;
		
Actor* _JetpackActor;

ActorType* _gunActorType;

Actor* _gunActor;

float _currentangle;

}
@end

@implementation Design_29_29_attachguntoplayer

-(void)load
{
	            if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:0] floatValue]] two:[NSNumber numberWithFloat:2]])
{
            _gunActorType = [self getActorType:126];
}

        if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:1] floatValue]] two:[NSNumber numberWithFloat:2]])
{
            _gunActorType = [self getActorType:124];
}

        [self createActor:_gunActorType x:[mActor getX] y:[mActor getY] layerConst:FRONT];
        _gunActor = [self getLastCreatedActor];
        [_gunActor sayToBehavior:@"Jetpack Follow Player" msg:@"Sync" withArgs:[NSArray arrayWithObjects:mActor,nil]];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_29_29_attachguntoplayer* self = (Design_29_29_attachguntoplayer*) theScript;
        if(![self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"gunDirection"] floatValue]] two:[NSNumber numberWithFloat:0]])
{
            [_gunActor setAngle:SP_D2R([[self getGameAttribute:@"gunDirection"] floatValue])];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end