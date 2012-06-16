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



@interface Design_17_17_ScoreManager : SceneScript 
{
	@public
		NSString* tempHolder;
		
NSString* _ScoreFont;

float _XOffset;

float _YOffset;

float _MinimumDigits;

float _CurrentScore;

NSString* _GameAttribute;

NSString* _FormattedScore;

float _CurrentLength;

BOOL _Persistent;

}
@end

@implementation Design_17_17_ScoreManager

-(void)load
{
	    [self doesCustomDrawing];
        _CurrentScore = 0;
        
tempHolder = _GameAttribute;_GameAttribute = @"INTERNALGLOBALSCORE";
[_GameAttribute retain];
[tempHolder release];
        if(_Persistent)
{
            if(!((([self asNumber:[self getGameAttribute:_GameAttribute]] <= 0) || ([self asNumber:[self getGameAttribute:_GameAttribute]] >= 0))))
{
                [self setGameAttribute:_GameAttribute value:[NSNumber numberWithFloat:_CurrentScore]];
}

            else
{
                _CurrentScore = [self asNumber:[self getGameAttribute:_GameAttribute]];
}

}

    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_17_17_ScoreManager* self = (Design_17_17_ScoreManager*) theScript;
        [self FormatScore];
         
}];

} 

    

/* Params are:__Amount */
- ( void) IncrementScore:(NSArray*)args
{
float __Amount = (float) [[args objectAtIndex:0] floatValue];
        _CurrentScore += __Amount;
        [self UpdateGlobalScore];
}
    

/* Params are:__Amount */
- ( void) DecrementScore:(NSArray*)args
{
float __Amount = (float) [[args objectAtIndex:0] floatValue];
        _CurrentScore -= __Amount;
        [self UpdateGlobalScore];
}
    -(void)UpdateGlobalScore
{
        if(_Persistent)
{
            [self setGameAttribute:_GameAttribute value:[NSNumber numberWithFloat:_CurrentScore]];
}

}

    

/* Params are:__Font */
- ( void) SetScoreFont:(NSArray*)args
{
NSString* __Font = (NSString*) [args objectAtIndex:0];
        _ScoreFont = __Font;
}
    

/* Params are:__Horizontal __Vertical */
- ( void) SetDrawOffset:(NSArray*)args
{
float __Horizontal = (float) [[args objectAtIndex:0] floatValue];

float __Vertical = (float) [[args objectAtIndex:1] floatValue];
        _XOffset = __Horizontal;
        _YOffset = __Vertical;
}
    

/* Params are:*/
- ( NSNumber*) GetXOffset:(NSArray*)args
{
        return [NSNumber numberWithFloat:_XOffset];
}
    

/* Params are:*/
- ( NSNumber*) GetYOffset:(NSArray*)args
{
        return [NSNumber numberWithFloat:_YOffset];
}
    -(void)FormatScore
{
        
tempHolder = _FormattedScore;_FormattedScore = [NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:_CurrentScore]];
[_FormattedScore retain];
[tempHolder release];
        _CurrentLength = (_MinimumDigits - [_FormattedScore length]);
        for(int index0 = 0; index0 < _CurrentLength; index0++)
{
            
tempHolder = _FormattedScore;_FormattedScore = [@"0" stringByAppendingString:_FormattedScore];
[_FormattedScore retain];
[tempHolder release];
}

}

    

/* Params are:*/
- ( NSNumber*) GetScore:(NSArray*)args
{
        return [NSNumber numberWithFloat:_CurrentScore];
}
    

/* Params are:__Score */
- ( void) SetScore:(NSArray*)args
{
float __Score = (float) [[args objectAtIndex:0] floatValue];
        _CurrentScore = __Score;
        [self UpdateGlobalScore];
}
    

/* Params are:*/
- ( NSString*) GetFont:(NSArray*)args
{
        return _ScoreFont;
}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end