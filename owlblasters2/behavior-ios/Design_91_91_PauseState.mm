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



@interface Design_91_91_PauseState : SceneScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_91_91_PauseState

-(void)load
{
	    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_91_91_PauseState* self = (Design_91_91_PauseState*) theScript;
        if([[Game game] isPaused])
{
            [[Game game] setColor:[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
            [[Game game] setAlpha:50/100.0];
             
            [[Game game] fillRect:0 y:0 w:[self getScreenWidth] h:[self getScreenHeight]];
}

        [[Game game] setAlpha:0/100.0];
}];
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
Design_91_91_PauseState* self = (Design_91_91_PauseState*) theScript;
        [[Game game] unpause];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end