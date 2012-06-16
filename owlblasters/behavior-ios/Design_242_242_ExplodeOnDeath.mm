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



@interface Design_242_242_ExplodeOnDeath : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _MaximumSpeed;

float _NumberofFragments;

ActorType* _FragmentActorType;

float _MinimumSpeed;

float _MaximumTurningSpeed;

float _Offset;

BOOL _RecycledActors;

ActorType* _ExplosionActorType;

float _Direction;

}
@end

@implementation Design_242_242_ExplodeOnDeath

-(void)load
{
	    [self addWhenKilledListener:mActor func:^(NSMutableArray* list, Script* theScript){
Design_242_242_ExplodeOnDeath* self = (Design_242_242_ExplodeOnDeath*) theScript;
        if((_ExplosionActorType != nil))
{
            if(_RecycledActors)
{
                [self createRecycledActor:_ExplosionActorType x:0 y:0 layerConst:FRONT];
}

            else
{
                [self createActor:_ExplosionActorType x:0 y:0 layerConst:FRONT];
}

            /* ([mActor getXCenter] - [[self getLastCreatedActor] getWidth]/2) */
            /* above is the same for Y I am changing this so that I can make the explosions act work at the location of the player */
            [[self getLastCreatedActor] setXPosition:([[mActor getLastCollidedActor] getX] + 7)];
            [[self getLastCreatedActor] setYPosition:([mActor getY] + -10)];
}

        if((_FragmentActorType != nil))
{
            for(int index0 = 0; index0 < _NumberofFragments; index0++)
{
                if(_RecycledActors)
{
                    [self createRecycledActor:_FragmentActorType x:0 y:0 layerConst:FRONT];
}

                else
{
                    [self createActor:_FragmentActorType x:0 y:0 layerConst:FRONT];
}

                _Direction = [Script randomIntBetween:(int)0 to:(int)360];
                [[self getLastCreatedActor] setXPosition:(([mActor getXCenter] - [[self getLastCreatedActor] getWidth]/2) + (_Offset * cos(SP_D2R(_Direction))))];
                [[self getLastCreatedActor] setYPosition:(([mActor getYCenter] - [[self getLastCreatedActor] getHeight]/2) + (_Offset * sin(SP_D2R(_Direction))))];
                [[self getLastCreatedActor] setVelocityAtAngle:_Direction withSpeed:(_MinimumSpeed + ([Script randomFloat] * _MaximumSpeed))];
                [[self getLastCreatedActor] setAngularVelocity:SP_D2R((-(_MaximumTurningSpeed) + (([Script randomFloat] * _MaximumTurningSpeed) * 2)))];
}

}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end