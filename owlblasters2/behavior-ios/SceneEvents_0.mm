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



@interface SceneEvents_0 : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _sound;

}
@end

@implementation SceneEvents_0

-(void)load
{
	    [self doesCustomDrawing];
        [self fadeInMasterVolume:1];
        [self playSound:[self getSound:171]];
        [self playSound:[self getSound:147]];
        [self playSound:[self getSound:149]];
        [self playSound:[self getSound:152]];
        [[Assets get] unloadAtlas:1];
        [[Assets get] unloadAtlas:2];
        [[Assets get] unloadAtlas:3];
        [[Assets get] unloadAtlas:4];
        [[Assets get] unloadAtlas:7];
        [[Assets get] unloadAtlas:8];
        [self loadGame];

        if([self sameAs:[NSNumber numberWithFloat:[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) count]] two:[NSNumber numberWithFloat:0]])
{
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
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:15]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:5]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"laserRifleStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:2]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) atIndex:0 withObject:[NSNumber numberWithFloat:15]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) atIndex:1 withObject:[NSNumber numberWithFloat:5]];
            [self insertIntoList:(NSMutableArray*) ([self getGameAttribute:@"grenadeLauncherStats"]) atIndex:2 withObject:[NSNumber numberWithFloat:2]];
            [self saveGame];

}

    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        [[Game game] setFont:[ self getFont:170] size:1];
        [[Game game] drawString:@"Owl" x:70 y:115];
        [[Game game] drawString:@"Blasters" x:60 y:150];
        [[Game game] setFont:[ self getFont:20] size:1];
                    [[Game game] drawString:@"Tap to Begin" x:50 y:430];
         
}];
     
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        [self stopAllSounds];
        if([[self getGameAttribute:@"First"] boolValue])
{
            [self setGameAttribute:@"First" value:[NSNumber numberWithBool:FALSE]];
            [self switchScene:20 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

        if(!([[self getGameAttribute:@"First"] boolValue]))
{
            [self switchScene:1 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

}];
    [self doPeriodically:1000 * [Script randomIntBetween:(int)2 to:(int)4] task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        _sound = [Script randomIntBetween:(int)0 to:(int)5];
        if([self sameAs:[NSNumber numberWithFloat:_sound] two:[NSNumber numberWithFloat:0]])
{
            [self playSound:[self getSound:147]];
}

        if([self sameAs:[NSNumber numberWithFloat:_sound] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:[self getSound:148]];
}

        if([self sameAs:[NSNumber numberWithFloat:_sound] two:[NSNumber numberWithFloat:2]])
{
            [self playSound:[self getSound:149]];
}

        if([self sameAs:[NSNumber numberWithFloat:_sound] two:[NSNumber numberWithFloat:3]])
{
            [self playSound:[self getSound:150]];
}

        if([self sameAs:[NSNumber numberWithFloat:_sound] two:[NSNumber numberWithFloat:4]])
{
            [self playSound:[self getSound:151]];
}

        if([self sameAs:[NSNumber numberWithFloat:_sound] two:[NSNumber numberWithFloat:5]])
{
            [self playSound:[self getSound:152]];
}

}]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end