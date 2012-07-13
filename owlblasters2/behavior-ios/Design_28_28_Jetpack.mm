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



@interface Design_28_28_Jetpack : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _CurrentFuel;

float _MaximumFuel;

float _ConsumptionRate;

float _Thrust;

float _MaxSpeed;

float _FuelBarWidth;

float _FuelBarHeight;

UIColor* _Over75Color;

UIColor* _Over50Color;

UIColor* _Over25Color;

UIColor* _Under25Color;

float _PercentLeft;

float _RechargeRate;

float _FuelBarXOffset;

float _FuelBarYOffset;

float _ThrustDirection;

NSString* _FuelBarOrientation;

NSString* _JetpackKey;

BOOL _UseAnimations;

NSString* _PlayerAnimRight;

BOOL _JetpackIdle;

BOOL _SpawnExternalJetpack;

NSString* _PlayerAnimLeft;

Actor* _JetpackActor;

ActorType* _JetpackActorType;

float _SputterForce;

}
@end

@implementation Design_28_28_Jetpack

-(void)load
{
	    [self doesCustomDrawing];
        if(_SpawnExternalJetpack)
{
            [self createActor:_JetpackActorType x:[mActor getX] y:[mActor getY] layerConst:FRONT];
            _JetpackActor = [self getLastCreatedActor];
            [_JetpackActor sayToBehavior:@"Jetpack Follow Player" msg:@"Sync" withArgs:[NSArray arrayWithObjects:mActor,nil]];
}

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_28_28_Jetpack* self = (Design_28_28_Jetpack*) theScript;
        if([self isKeyDown:_JetpackKey])
{
            _JetpackIdle = FALSE;
            if((_CurrentFuel > 0))
{
                /* @"Jetpack key is down, and we have fuel - so fire boosters as long as we're not past max speed. " */
                if(!(([mActor getYVelocity] < -(_MaxSpeed))))
{
                    [mActor applyImpulseInDirection:_ThrustDirection withForce:_Thrust];
}

                if((_JetpackActor != nil))
{
                    [_JetpackActor sayToBehavior:@"Jetpack Follow Player" msg:@"JetsActive" withArgs:nil];
}

                /* @"Use up some fuel" */
                _CurrentFuel -= _ConsumptionRate;
                /* @"Set the animation of the player" */
                [self SetPlayerAnimation];
}

            else
{
                [mActor applyImpulseInDirection:_ThrustDirection withForce:_SputterForce];
                [_JetpackActor sayToBehavior:@"Jetpack Follow Player" msg:@"JetsEmpty" withArgs:nil];
}

}

        else
{
            _JetpackIdle = TRUE;
            if((_JetpackActor != nil))
{
                [_JetpackActor sayToBehavior:@"Jetpack Follow Player" msg:@"JetsIdle" withArgs:nil];
}

            /* @"If we need fuel, replenish it now" */
            if((_CurrentFuel < _MaximumFuel))
{
                _CurrentFuel += _RechargeRate;
}

            /* @"If we were using the jetpack, clear it out so another animation can play" */
            if([self sameAs:@"" two:@"Jetpack"])
{

}

}

        /* @"Update our fuel percentage so we can display the fuel bar" */
        _PercentLeft = (_CurrentFuel / _MaximumFuel);
}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_28_28_Jetpack* self = (Design_28_28_Jetpack*) theScript;
        [[Game game] setColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
        /* @"Draw the main outline in black" */
        [[Game game] fillRect:_FuelBarXOffset y:_FuelBarYOffset w:_FuelBarWidth h:_FuelBarHeight];
        /* @"Now determine the color of the fuel bar based on the amount of remaining fuel. " */
        if((_PercentLeft > .75))
{
            [[Game game] setColor:_Over75Color];
}

        else if((_PercentLeft > .50))
{
            [[Game game] setColor:_Over50Color];
}

        else if((_PercentLeft > .25))
{
            [[Game game] setColor:_Over25Color];
}

        else
{
            [[Game game] setColor:_Under25Color];
}

        /* @"Draw the remaining fuel bar based on Horizontal or Vertical orientation" */
        if([self sameAs:_FuelBarOrientation two:@"H"])
{
            [[Game game] fillRect:(_FuelBarXOffset + 1) y:(_FuelBarYOffset + 1) w:(((int) round((_FuelBarWidth * _PercentLeft))) - 2) h:(_FuelBarHeight - 2)];
}

        else
{
            [[Game game] fillRect:(_FuelBarXOffset + 1) y:((_FuelBarYOffset + ((int) round((_FuelBarHeight * (1 - _PercentLeft))))) + 1) w:(_FuelBarWidth - 2) h:(((int) round((_FuelBarHeight * _PercentLeft))) - 2)];
}

}];

} 

    -(void)SetPlayerAnimation
{
        if(_UseAnimations)
{
            if([self asBoolean:[mActor getActorValue:@"Facing Right?"]])
{

}

            else
{

}

}

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end