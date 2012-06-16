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
        [self loadGame];

        /* this portion of the code is used for intializing variables because list default values are flawed */
        if([self sameAs:[NSNumber numberWithFloat:[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) count]] two:[NSNumber numberWithFloat:0]])
{
            /* @"initializing the player's gun array" */
            [(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) removeAllObjects];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:0 withObject:[NSNumber numberWithFloat:2]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:1 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:2 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:3 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:4 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:5 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:6 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) atIndex:7 withObject:[NSNumber numberWithFloat:0]];
            /* initialize the individual gun stats
0: dmg, 1: rate, 2: penatration */
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:3]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:2]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"pistolStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:4]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:4]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"clawStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:20]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:6]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:1]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"revolverStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:1]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:3]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:1]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"shotgunStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:0]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:10]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:2]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserPistolStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:1]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:10]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:4]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"scytheStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:20]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:15]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:1]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:20]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:15]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:5]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:2]];
}

        [self saveGame];

    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_1* self = (SceneEvents_1*) theScript;
        [[Game game] setFont:[ self getFont:413] size:1];
        [[Game game] drawString:@"Owl" x:120 y:25];
        [[Game game] drawString:@"Blasters" x:60 y:75];
        [[Game game] setFont:[ self getFont:232] size:1];
        [[Game game] drawString:@"Beta" x:75 y:150];
        [[Game game] setFont:[ self getFont:420] size:1];
                    [[Game game] drawString:@"Tap to Begin" x:80 y:400];
         
}];
     
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
SceneEvents_1* self = (SceneEvents_1*) theScript;
        [self switchScene:6 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end