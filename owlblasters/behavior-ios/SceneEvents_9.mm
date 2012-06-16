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



@interface SceneEvents_9 : SceneScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation SceneEvents_9

-(void)load
{
	    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_9* self = (SceneEvents_9*) theScript;
        [[Game game] setFont:[ self getFont:205] size:1];
        [[Game game] drawString:@"Controls" x:50 y:50];
        [[Game game] setFont:[ self getFont:418] size:1];
                    [[Game game] drawString:@"Tap in a Direction To Shoot" x:5 y:100];
            [[Game game] drawString:@"Tilt to Move" x:5 y:130];
            [[Game game] drawString:@"Tap on Self to Bomb" x:5 y:160];
         
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end