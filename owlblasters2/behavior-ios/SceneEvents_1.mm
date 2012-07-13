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



@interface SceneEvents_1 : SceneScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation SceneEvents_1

-(void)load
{
	    [self doesCustomDrawing];
        [self saveGame];

        [self setMasterVolume:(float)50/(float)100];
        [self playSound:[self getSound:182]];
        [[Assets get] unloadAtlas:1];
        [[Assets get] unloadAtlas:2];
        [[Assets get] unloadAtlas:3];
        [[Assets get] unloadAtlas:4];
        [[Assets get] unloadAtlas:7];
        [[Assets get] unloadAtlas:8];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_1* self = (SceneEvents_1*) theScript;
        [[Game game] setFont:[ self getFont:170] size:1];
        [[Game game] drawString:@"Menu" x:95 y:20];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end