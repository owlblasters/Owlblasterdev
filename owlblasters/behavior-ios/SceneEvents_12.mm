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



@interface SceneEvents_12 : SceneScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation SceneEvents_12

-(void)load
{
	    [self doesCustomDrawing];
        [self saveGame];

    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_12* self = (SceneEvents_12*) theScript;
        [[Game game] setFont:[ self getFont:233] size:1];
        [[Game game] drawString:@"BGM" x:150 y:100];
        [[Game game] setFont:[ self getFont:233] size:1];
        [[Game game] drawString:@"SFX" x:150 y:250];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end