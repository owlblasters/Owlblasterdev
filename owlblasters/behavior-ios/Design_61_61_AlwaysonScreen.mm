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



@interface Design_61_61_AlwaysonScreen : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _PositionXonScreen;

float _PositionYonScreen;

BOOL _Fixedonscreen;

BOOL _Movefree;

float _IfitmovefreePutanumberbetween13;

float _Forceofbounce;

float _ObjectWidth;

float _ObjectHeight;

BOOL _TeleportCenter;

float _XTeleport;

float _YTeleport;

BOOL _SlowDown0;

float _PixelsBack;

}
@end

@implementation Design_61_61_AlwaysonScreen

-(void)load
{
	    [self doesCustomDrawing];
        /* @"Get object Width and Height" */
        _ObjectWidth = (([mActor getXCenter] - [mActor getX]) * 2);
        _ObjectHeight = (([mActor getYCenter] - [mActor getY]) * 2);
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_61_61_AlwaysonScreen* self = (Design_61_61_AlwaysonScreen*) theScript;
        /* @"If the object is fixed" */
        if(_Fixedonscreen)
{
            /* @"Disable gravity and set the position of object" */
            [mActor setIgnoreGravity:!FALSE];
            [mActor setXPosition:([self getScreenX] + _PositionXonScreen)];
            [mActor setYPosition:([self getScreenY] + _PositionYonScreen)];
}

        /* @"If it move free" */
        if((_Movefree && !(_Fixedonscreen)))
{
            /* @"If the object bounce on the screen" */
            if([self sameAs:[NSNumber numberWithFloat:_IfitmovefreePutanumberbetween13] two:[NSNumber numberWithFloat:1]])
{
                if(([mActor getXOnScreen] < 1))
{
                    [mActor applyImpulseInDirection:0 withForce:_Forceofbounce];
}

                if((([mActor getX] + _ObjectWidth) > ([self getScreenX] + ([self getScreenWidth] - 1))))
{
                    [mActor applyImpulseInDirection:180 withForce:_Forceofbounce];
}

                if(([mActor getYOnScreen] < 1))
{
                    [mActor applyImpulseInDirection:90 withForce:_Forceofbounce];
}

                if((([mActor getY] + _ObjectHeight) > ([self getScreenY] + ([self getScreenHeight] - 1))))
{
                    [mActor applyImpulseInDirection:270 withForce:_Forceofbounce];
}

}

            /* @"If its teleported to center" */
            if([self sameAs:[NSNumber numberWithFloat:_IfitmovefreePutanumberbetween13] two:[NSNumber numberWithFloat:2]])
{
                if(((([mActor getXOnScreen] < 1) || (([mActor getX] + _ObjectWidth) > ([self getScreenX] + ([self getScreenWidth] - 1)))) || (([mActor getYOnScreen] < 1) || (([mActor getY] + _ObjectHeight) > ([self getScreenY] + ([self getScreenHeight] - 1))))))
{
                    /* @"Slow Down" */
                    if(_SlowDown0)
{
                        [mActor setXVelocity:0];
                        [mActor setYVelocity:0];
}

                    /* @"If Teleport to center" */
                    if(_TeleportCenter)
{
                        [mActor setXPosition:([self getScreenX] + ([self getScreenWidth] / 2))];
                        [mActor setYPosition:([self getScreenY] + ([self getScreenHeight] / 2))];
}

                    /* @"If Teleport to X & Y" */
                    if(!(_TeleportCenter))
{
                        [mActor setXPosition:([self getScreenX] + _XTeleport)];
                        [mActor setYPosition:([self getScreenY] + _YTeleport)];
}

                    /* @"Slow Down" */
                    if(_SlowDown0)
{
                        [mActor setXVelocity:0];
                        [mActor setYVelocity:0];
}

}

}

            /* @"If its pushed with the screen" */
            if([self sameAs:[NSNumber numberWithFloat:_IfitmovefreePutanumberbetween13] two:[NSNumber numberWithFloat:3]])
{
                if(([mActor getXOnScreen] < 1))
{
                    /* @"Slow Down" */
                    if(_SlowDown0)
{
                        [mActor setXVelocity:0];
                        [mActor setYVelocity:0];
}

                    [mActor setXPosition:([self getScreenX] + _PixelsBack)];
}

                if((([mActor getX] + _ObjectWidth) > ([self getScreenX] + ([self getScreenWidth] - 1))))
{
                    /* @"Slow Down" */
                    if(_SlowDown0)
{
                        [mActor setXVelocity:0];
                        [mActor setYVelocity:0];
}

                    [mActor setXPosition:([self getScreenX] + ([self getScreenWidth] - (_ObjectWidth + _PixelsBack)))];
}

                if(([mActor getYOnScreen] < 1))
{
                    /* @"Slow Down" */
                    if(_SlowDown0)
{
                        [mActor setXVelocity:0];
                        [mActor setYVelocity:0];
}

                    [mActor setYPosition:([self getScreenY] + _PixelsBack)];
}

                if((([mActor getY] + _ObjectHeight) > ([self getScreenY] + ([self getScreenHeight] - 1))))
{
                    /* @"Slow Down" */
                    if(_SlowDown0)
{
                        [mActor setXVelocity:0];
                        [mActor setYVelocity:0];
}

                    [mActor setYPosition:([self getScreenY] + ([self getScreenHeight] - (_ObjectHeight + _PixelsBack)))];
}

}

}

}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_61_61_AlwaysonScreen* self = (Design_61_61_AlwaysonScreen*) theScript;
        /* @"Possible Errors" */
        if((_Fixedonscreen && _Movefree))
{
            [mActor disableBehavior:@"Always on Screen"];
}

        if((!(_Fixedonscreen) && !(_Movefree)))
{
            [mActor disableBehavior:@"Always on Screen"];
}

        if((_Movefree && ((_IfitmovefreePutanumberbetween13 < 1) || (_IfitmovefreePutanumberbetween13 > 3))))
{
            [mActor disableBehavior:@"Always on Screen"];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end