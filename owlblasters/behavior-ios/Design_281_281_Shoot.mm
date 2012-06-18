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



@interface Design_281_281_Shoot : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _xoffset;

float _yoffset;

}
@end

@implementation Design_281_281_Shoot

-(void)load
{
	     
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
Design_281_281_Shoot* self = (Design_281_281_Shoot*) theScript;
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:[self getSound:339]];
}

        _xoffset = ([self getTouchX] - [mActor getXCenter]);
        _yoffset = ([self getTouchX] - [mActor getYCenter]);
        if((![self sameAs:[NSNumber numberWithFloat:2] two:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:1] floatValue]]] && ![self sameAs:[NSNumber numberWithFloat:2] two:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:6] floatValue]]]))
{
            if(([self sameAs:[mActor getAnimation] two:@"jump-l"] || [self sameAs:[mActor getAnimation] two:@"idle-l"]))
{
                [self createRecycledActor:[self getActorType:60] x:([mActor getXCenter] + -40) y:([mActor getYCenter] + 0) layerConst:FRONT];
                [self setGameAttribute:@"gunDirection" value:[NSNumber numberWithFloat:SP_R2D((atan2(_yoffset, _xoffset) + 135))]];
}

            else
{
                [self createRecycledActor:[self getActorType:60] x:[mActor getXCenter] y:([mActor getYCenter] + 0) layerConst:FRONT];
                [self setGameAttribute:@"gunDirection" value:[NSNumber numberWithFloat:SP_R2D(atan2(_yoffset, _xoffset))]];
}

            [[self getLastCreatedActor] applyImpulse:_xoffset dirY:_yoffset withForce:5];
}

        else if([self sameAs:[NSNumber numberWithFloat:2] two:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:1] floatValue]]])
{
            if(([self sameAs:[mActor getAnimation] two:@"jump-l"] || [self sameAs:[mActor getAnimation] two:@"idle-l"]))
{
                [self createActor:[self getActorType:312] x:([mActor getXCenter] + -40) y:([mActor getYCenter] + 0) layerConst:FRONT];
                [[self getLastCreatedActor] setActorValue:@"dir" value:[NSNumber numberWithFloat:-1]];
                [self setGameAttribute:@"gunDirection" value:[NSNumber numberWithFloat:SP_R2D((atan2(_yoffset, _xoffset) + 135))]];
}

            else
{
                [self createActor:[self getActorType:312] x:[mActor getXCenter] y:([mActor getYCenter] + 0) layerConst:FRONT];
                [[self getLastCreatedActor] setActorValue:@"dir" value:[NSNumber numberWithFloat:1]];
                [self setGameAttribute:@"gunDirection" value:[NSNumber numberWithFloat:SP_R2D(atan2(_yoffset, _xoffset))]];
}

}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end