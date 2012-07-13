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



@interface SceneEvents_19 : SceneScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation SceneEvents_19

-(void)load
{
	    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_19* self = (SceneEvents_19*) theScript;
        [[Game game] setFont:[ self getFont:170] size:1];
        [[Game game] drawString:@"How To Play" x:15 y:5];
        [[Game game] setFont:[ self getFont:173] size:1];
        [[Game game] drawString:@"Killing Owls earns Credits" x:2 y:60];
        [[Game game] setFont:[ self getFont:172] size:1];
        [[Game game] drawString:@"3/3" x:132 y:420];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end