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
        [[Game game] drawString:@"Controls" x:50 y:5];
        [[Game game] setFont:[ self getFont:418] size:1];
                    [[Game game] drawString:@"Tap in a Direction" x:5 y:50];
            [[Game game] drawString:@"To Shoot" x:5 y:80];
            [[Game game] drawString:@"Tilt to Move" x:5 y:110];
            [[Game game] drawString:@"Tap on Self to Bomb" x:5 y:140];
         
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end