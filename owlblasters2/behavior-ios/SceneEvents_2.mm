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



@interface SceneEvents_2 : SceneScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation SceneEvents_2

-(void)load
{
	    [self doesCustomDrawing];
        [[Assets get] unloadAtlas:1];
        [[Assets get] unloadAtlas:2];
        [[Assets get] unloadAtlas:3];
        [[Assets get] unloadAtlas:4];
        [[Assets get] unloadAtlas:7];
        [[Assets get] unloadAtlas:8];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_2* self = (SceneEvents_2*) theScript;
        [[Game game] setFont:[ self getFont:170] size:1];
        [[Game game] drawString:@"Controls" x:65 y:5];
        [[Game game] setFont:[ self getFont:173] size:1];
                    [[Game game] drawString:@"Tap in Direction" x:25 y:60];
            [[Game game] drawString:@"To Shoot" x:50 y:90];
            [[Game game] drawString:@"Tilt to Move" x:40 y:120];
            [[Game game] drawString:@"Tap on Self" x:40 y:150];
            [[Game game] drawString:@"To Bomb" x:60 y:180];
         
        [[Game game] setFont:[ self getFont:172] size:1];
        [[Game game] drawString:@"1/3" x:130 y:420];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end