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



@interface SceneEvents_5 : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _Y;

float _X;

}
@end

@implementation SceneEvents_5

-(void)load
{
	     
    [self addTouchPressedListener:^(NSMutableArray* list, Script* theScript){
SceneEvents_5* self = (SceneEvents_5*) theScript;
        [self switchScene:1 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
SceneEvents_5* self = (SceneEvents_5*) theScript;
        [[Game game] setFont:[ self getFont:170] size:1];
        [[Game game] drawString:@"Owl Blasters" x:5 y:5];
        [[Game game] drawString:@"Development" x:5 y:40];
        [[Game game] setFont:[ self getFont:172] size:1];
        [[Game game] drawString:@"Developers" x:5 y:80];
        [[Game game] setFont:[ self getFont:173] size:1];
        [[Game game] drawString:@"Jonathan Wu" x:5 y:120];
        [[Game game] drawString:@"David Silin" x:5 y:170];
        [[Game game] setFont:[ self getFont:172] size:1];
        [[Game game] drawString:@"Artists" x:5 y:190];
        [[Game game] setFont:[ self getFont:173] size:1];
        [[Game game] drawString:@"Marlon Antunez" x:5 y:220];
        [[Game game] drawString:@"Kapu" x:170 y:220];
        [[Game game] drawString:@"Sunrisekingdom" x:5 y:250];
        [[Game game] drawString:@"IWonderZero" x:170 y:250];
        [[Game game] drawString:@"Micro Mister" x:5 y:280];
        [[Game game] drawString:@"Ceric" x:170 y:280];
        [[Game game] setFont:[ self getFont:172] size:1];
        [[Game game] drawString:@"Music and Sounds" x:5 y:320];
        [[Game game] setFont:[ self getFont:173] size:1];
        [[Game game] drawString:@"Metal Renard" x:5 y:350];
        [[Game game] drawString:@"Stencyl" x:170 y:350];
        [[Game game] setFont:[ self getFont:20] size:1];
        [[Game game] drawString:@"Thanks For" x:5 y:370];
        [[Game game] drawString:@"Playing!" x:5 y:410];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end