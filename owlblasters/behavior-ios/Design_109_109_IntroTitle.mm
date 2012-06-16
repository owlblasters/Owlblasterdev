#import <Box2D/Box2D.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "SceneScript.h"

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



@interface Design_109_109_IntroTitle : SceneScript 
{
	@public
		NSString* tempHolder;
		
BOOL started;

NSString* _FontToUse;

float _TimeBeforeRetreat;

float _YCentrePosition;

NSString* _AlternativeText;

float _SlideSpeed;

BOOL _DrawRectangle;

float _XCentrePosition;

UIColor* _FillColour;

UIColor* _StrokeColour;

float _Padding;

float _StrokeThickness;

NSString* _SlideDirection;

float _Rounding;

}
@end

@implementation Design_109_109_IntroTitle

-(void)load
{
	    [self doesCustomDrawing];
        started = FALSE;
        [self doLater:1000 * _TimeBeforeRetreat task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_109_109_IntroTitle* self = (Design_109_109_IntroTitle*) theScript;
                    started = TRUE;
                    _SlideSpeed = -5;
}]];
        if(((_AlternativeText == nil) || [self sameAs:[NSNumber numberWithFloat:[_AlternativeText length]] two:[NSNumber numberWithFloat:0]]))
{
            
tempHolder = _AlternativeText;_AlternativeText = [NSString stringWithFormat:@"%@", [self getCurrentSceneName]];
[_AlternativeText retain];
[tempHolder release];
}

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_109_109_IntroTitle* self = (Design_109_109_IntroTitle*) theScript;
        if(started)
{
            if([self sameAs:_SlideDirection two:@"Up"])
{
                _YCentrePosition -= _SlideSpeed;
}

            else if([self sameAs:_SlideDirection two:@"Down"])
{
                _YCentrePosition += _SlideSpeed;
}

            else if([self sameAs:_SlideDirection two:@"Left"])
{
                _XCentrePosition -= _SlideSpeed;
}

            else if([self sameAs:_SlideDirection two:@"Right"])
{
                _XCentrePosition += _SlideSpeed;
}

            _SlideSpeed += 0.75;
}

}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_109_109_IntroTitle* self = (Design_109_109_IntroTitle*) theScript;
        [[Game game] setAlpha:(100 - _SlideSpeed)/100.0];
        if(_DrawRectangle)
{
            [[Game game] setColor:_FillColour];
            [[Game game] setStrokeColor:_StrokeColour];
            [[Game game] setStrokeThickness:_StrokeThickness];
            [[Game game] fillRoundRect:(_XCentrePosition - (([[Game game] getWidthForString:[[Game game] getFont] string:_AlternativeText] / 2) + _Padding)) y:(_YCentrePosition - (([[Game game] getHeightForString:[[Game game] getFont] string:@"A1"] / 2) + _Padding)) w:([[Game game] getWidthForString:[[Game game] getFont] string:_AlternativeText] + (_Padding * 2)) h:([[Game game] getHeightForString:[[Game game] getFont] string:@"A1"] + (_Padding * 2)) arcSize:_Rounding];
            [[Game game] drawRoundRect:(_XCentrePosition - (([[Game game] getWidthForString:[[Game game] getFont] string:_AlternativeText] / 2) + _Padding)) y:(_YCentrePosition - (([[Game game] getHeightForString:[[Game game] getFont] string:@"A1"] / 2) + _Padding)) w:([[Game game] getWidthForString:[[Game game] getFont] string:_AlternativeText] + (_Padding * 2)) h:([[Game game] getHeightForString:[[Game game] getFont] string:@"A1"] + (_Padding * 2)) arcSize:_Rounding];
}

         
        [[Game game] setAlpha:100/100.0];
}];

} 

    

/* Params are:*/
- ( NSString*) IntroTitleText:(NSArray*)args
{
        return _AlternativeText;
}
    

/* Params are:*/
- ( NSNumber*) IntroTitleCentreX:(NSArray*)args
{
        return [NSNumber numberWithFloat:_XCentrePosition];
}
    

/* Params are:*/
- ( NSNumber*) IntroTitleCentreY:(NSArray*)args
{
        return [NSNumber numberWithFloat:_YCentrePosition];
}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end