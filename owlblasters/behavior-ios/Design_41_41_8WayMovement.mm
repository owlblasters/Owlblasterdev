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



@interface Design_41_41_8WayMovement : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _RightControl;

float _MoveX;

NSString* _DownControl;

NSString* _LeftControl;

float _Sqrt2;

BOOL _StopTurningWhileMoving;

float _MoveY;

BOOL _NormalizeDiagonalSpeed;

BOOL _UseControls;

float _Speed;

NSString* _UpAnimation;

NSString* _UpAnimationIdle;

BOOL _UseAnimations;

NSString* _LeftAnimation;

NSString* _LeftAnimationIdle;

NSString* _DownAnimation;

NSString* _DownAnimationIdle;

BOOL _PreferVerticalAnimtations;

NSString* _RightAnimation;

NSString* _RightAnimationIdle;

NSString* _UpControl;

}
@end

@implementation Design_41_41_8WayMovement

-(void)load
{
	            _Sqrt2 = sqrt(2);
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_41_41_8WayMovement* self = (Design_41_41_8WayMovement*) theScript;
        if(_UseControls)
{
            _MoveX = ([self asNumber:[NSNumber numberWithBool:[self isKeyDown:_RightControl]]] - [self asNumber:[NSNumber numberWithBool:[self isKeyDown:_LeftControl]]]);
            _MoveY = ([self asNumber:[NSNumber numberWithBool:[self isKeyDown:_DownControl]]] - [self asNumber:[NSNumber numberWithBool:[self isKeyDown:_UpControl]]]);
}

        if((_NormalizeDiagonalSpeed && (![self sameAs:[NSNumber numberWithFloat:_MoveX] two:[NSNumber numberWithFloat:0]] && ![self sameAs:[NSNumber numberWithFloat:_MoveY] two:[NSNumber numberWithFloat:0]])))
{
            [mActor setXVelocity:((_MoveX * _Speed) / _Sqrt2)];
            [mActor setYVelocity:((_MoveY * _Speed) / _Sqrt2)];
}

        else
{
            [mActor setXVelocity:(_MoveX * _Speed)];
            [mActor setYVelocity:(_MoveY * _Speed)];
}

        if((_StopTurningWhileMoving && (![self sameAs:[NSNumber numberWithFloat:_MoveX] two:[NSNumber numberWithFloat:0]] || ![self sameAs:[NSNumber numberWithFloat:_MoveY] two:[NSNumber numberWithFloat:0]])))
{
            [mActor setAngularVelocity:SP_D2R(0)];
}

        _MoveX = 0;
        _MoveY = 0;
        if(_UseAnimations)
{
            if(([self sameAs:[NSNumber numberWithFloat:[mActor getXVelocity]] two:[NSNumber numberWithFloat:0]] && [self sameAs:[NSNumber numberWithFloat:[mActor getYVelocity]] two:[NSNumber numberWithFloat:0]]))
{
                if([self sameAs:[mActor getAnimation] two:_UpAnimation])
{
                    if((_UpAnimationIdle != nil))
{
                        [mActor setAnimation:_UpAnimationIdle];
}

}

                else if([self sameAs:[mActor getAnimation] two:_DownAnimation])
{
                    if((_DownAnimationIdle != nil))
{
                        [mActor setAnimation:_DownAnimationIdle];
}

}

                else if([self sameAs:[mActor getAnimation] two:_LeftAnimation])
{
                    if((_LeftAnimationIdle != nil))
{
                        [mActor setAnimation:_LeftAnimationIdle];
}

}

                else if([self sameAs:[mActor getAnimation] two:_RightAnimation])
{
                    if((_RightAnimationIdle != nil))
{
                        [mActor setAnimation:_RightAnimationIdle];
}

}

}

            else if((([mActor getYVelocity] < 0) && ([self sameAs:[NSNumber numberWithFloat:[mActor getXVelocity]] two:[NSNumber numberWithFloat:0]] || _PreferVerticalAnimtations)))
{
                if((_UpAnimation != nil))
{
                    [mActor setAnimation:_UpAnimation];
}

}

            else if((([mActor getYVelocity] > 0) && ([self sameAs:[NSNumber numberWithFloat:[mActor getXVelocity]] two:[NSNumber numberWithFloat:0]] || _PreferVerticalAnimtations)))
{
                if((_DownAnimation != nil))
{
                    [mActor setAnimation:_DownAnimation];
}

}

            else if(([mActor getXVelocity] < 0))
{
                if((_LeftAnimation != nil))
{
                    [mActor setAnimation:_LeftAnimation];
}

}

            else if(([mActor getXVelocity] > 0))
{
                if((_RightAnimation != nil))
{
                    [mActor setAnimation:_RightAnimation];
}

}

}

}];

} 

    -(void)MoveUp
{
        _MoveY = -1;
}

    -(void)MoveDown
{
        _MoveY = 1;
}

    -(void)MoveLeft
{
        _MoveX = -1;
}

    -(void)MoveRight
{
        _MoveY = 1;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end